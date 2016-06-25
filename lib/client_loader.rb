require 'file_processor'
require 'distance_from_dublin'
require 'client_builder'
# loads and filters data based on file name and optional filtering block
module ClientLoader
  def self.filter(file_name)
    [].tap do |result|
      FileProcessor.run(file_name) do |text|
        client = ClientBuilder.from_json(text)
        result << client if yield(client)
      end
    end
  end
end
