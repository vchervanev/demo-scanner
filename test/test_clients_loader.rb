require 'minitest/autorun'
require 'clients_loader'
class TestClientsLoader < Minitest::Test
  EXPECTED_TEST_OUTPUT = "200: First Near\n".freeze
  TEST_FILE_NAME = 'test/test_valid_customers.jsons'.freeze

  def test_conditional_loading
    result = ClientsLoader.filter(TEST_FILE_NAME) do |client|
      client.id == 200
    end

    assert_equal 1, result.size
    assert_equal 200, result[0].id
  end
end
