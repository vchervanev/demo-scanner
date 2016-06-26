require 'minitest/autorun'
require 'orthodromic_distance'
class TestOrthodromicDistance < Minitest::Test
  def test_degree_to_radian
    assert_equal [Math::PI, 0], OrthodromicDistance.degree_to_radian([180, 0])
  end

  def test_calculate
    # top and bottom points, the distance equals to PI * r
    loc1 = [0, 0]
    loc2 = [0, 180]
    r = 1
    assert_equal Math::PI, OrthodromicDistance.calculate(loc1, loc2, r)
  end

  def test_calculate_radians
    # top and bottom points, the distance equals to PI * r
    loc1 = [0, 0]
    loc2 = [0, Math::PI]
    r = 1
    assert_equal Math::PI,
                 OrthodromicDistance.calculate(
                   loc1, loc2, r, OrthodromicDistance::RADIANS
                 )
  end
end
