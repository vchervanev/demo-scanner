require 'json'
require 'client'
# ClientBuilder -  all attributes are required (mustn't be null or empty)
class ClientBuilder
  REQUIRED_ATTRS = %w(latitude longitude user_id name).freeze
  ERR_ATTR_NOT_FOUND = 'Required attribute(s) %s not found'.freeze
  ERR_INVALID_FLOAT = 'Can\'t parse float value: "%s"'.freeze

  def self.from_json(text)
    attrs = JSON.parse(text)
    validate(attrs)
    location = [parse_float(attrs['latitude']), parse_float(attrs['longitude'])]
    id = attrs['user_id']
    name = attrs['name']
    Client.new(id, name, location)
  end

  def self.validate(value)
    errors = REQUIRED_ATTRS.select { |a| nil_or_empty?(value[a.to_s]) }

    raise ERR_ATTR_NOT_FOUND % errors.join(', ') if errors.any?
  end

  def self.nil_or_empty?(v)
    v.nil? || (v.is_a?(String) && v.empty?)
  end

  def self.parse_float(s)
    Float(s)
  rescue ArgumentError
    raise ERR_INVALID_FLOAT % s
  end

  private_class_method :validate, :nil_or_empty?, :parse_float
end
