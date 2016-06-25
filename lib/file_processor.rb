# Line-by-line file processor with exception handling
# any raised error stops processing
module FileProcessor
  def self.run(file_name, &block)
    raise 'Invalid usage: block is not given' unless block_given?
    begin
      File.foreach(file_name, &block)
    rescue StandardError
      print "Unable to process file: #{file_name}\n"
      raise
    end
  end
end
