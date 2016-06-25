# PORO
class Client
  attr_reader :location, :id, :name

  def initialize(id, name, location)
    @id = id
    @name = name
    @location = location
  end

  def to_s
    "#{id}: #{name}"
  end
end
