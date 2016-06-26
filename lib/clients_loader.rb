require 'file_processor'
require 'client_builder'
# loads and filters data based on file name and filtering block
module ClientsLoader
  def self.filter(file_name)
    [].tap do |result|
      FileProcessor.run(file_name) do |text|
        client = ClientBuilder.from_json(text)
        result << client if yield(client)
      end
    end
  end
end
