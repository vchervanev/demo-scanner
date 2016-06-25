require 'minitest/autorun'
require 'distance_from_dublin'
class TestDistanceFromDublin < Minitest::Test
  LOC_LONDON = [51.5074, -0.1278].freeze
  DIST_DUBLIN_TO_LONDON_KM = 463

  def test_to_london
    assert_equal DIST_DUBLIN_TO_LONDON_KM, DistanceFromDublin.to(LOC_LONDON).round
  end
end
