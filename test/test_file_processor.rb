require 'minitest/autorun'
require 'file_processor'
class TestFileProcessor < Minitest::Test
  TEST_POSITIVE_FILE_NAME = 'test/test_valid_customers.jsons'.freeze
  TEST_NEGATIVE_FILE_NAME = 'test/not_found.jsons'.freeze
  TEST_FILE_LINES = File.open(TEST_POSITIVE_FILE_NAME).read.split("\n")

  def test_positive_case
    lines = []
    FileProcessor.run(TEST_POSITIVE_FILE_NAME) do |line|
      lines << line.chomp
    end

    assert_equal TEST_FILE_LINES, lines
  end

  def test_negative_case
    assert_raises(StandardError) do
      FileProcessor.run(TEST_NEGATIVE_FILE_NAME) do
        assert false, 'This must not be run'
      end
    end
  end

  def test_interrupted_case
    index = 0
    assert_raises(StandardError) do
      FileProcessor.run(TEST_POSITIVE_FILE_NAME) do
        raise 'interrupt' if index == 1
        index += 1
        assert index < 2, 'File processing must be interrupted on the 2nd line'
      end
    end
  end
end
