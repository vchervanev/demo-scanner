require 'minitest/autorun'
require 'client'
class TestClient < Minitest::Test
  def test_new
    client = Client.new(:id, :name, :location)
    assert_equal :id, client.id
    assert_equal :name, client.name
    assert_equal :location, client.location
    assert_equal 'id: name', client.to_s
  end
end
