require 'minitest/autorun'
require 'client_builder'
class TestClientBuilder < Minitest::Test
  VALID_JSON =
    '{"latitude": "50.0", "user_id": 100, "name": "Far away", "longitude": "0"}'.freeze
  INVALID_JSON =
    '"latitude": "50.0", "user_id": 100, "name": "Far away", "longitude": "0"}'.freeze
  INCOMPLETE_JSON =
    '{"latitude": "50.0", "user_id": 100, "name": "Far away" }'.freeze
  INVALID_FLOAT_JSON =
    '{"latitude": "50a0", "user_id": 100, "name": "Far away" }'.freeze

  def test_positive
    c = ClientBuilder.from_json(VALID_JSON)
    assert_equal [50.0, 0], c.location
    assert_equal 100, c.id
    assert_equal 'Far away', c.name
  end

  def test_negative
    assert_raises(StandardError) { ClientBuilder.from_json(INVALID_JSON) }
  end

  def test_required_fields
    assert_raises(StandardError) { ClientBuilder.from_json(INCOMPLETE_JSON) }
  end

  def test_float_fields
    assert_raises(StandardError) { ClientBuilder.from_json(INVALID_FLOAT_JSON) }
  end
end
