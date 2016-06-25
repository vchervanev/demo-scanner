# Orthodromic Distance calculator
module OrthodromicDistance
  RADIANS = :radians
  DEGREES = :degrees

  def self.calculate(loc1, loc2, radius, metric = DEGREES)
    f1, f2, dl = preprocess_params(loc1, loc2, metric)
    radius * Math.acos(
      Math.sin(f1) * Math.sin(f2) + Math.cos(f1) * Math.cos(f2) * Math.cos(dl)
    )
  end

  def self.degree_to_radian(location)
    location.map { |degrees| degrees / 180 * Math::PI }
  end

  def self.preprocess_params(loc1, loc2, metric)
    if metric != RADIANS
      loc1 = degree_to_radian(loc1)
      loc2 = degree_to_radian(loc2)
    end
    f1, l1, f2, l2 = *(loc1 + loc2)
    dl = (l1 - l2).abs
    [f1, f2, dl]
  end

  private_class_method :preprocess_params
end
