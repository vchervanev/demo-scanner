require 'orthodromic_distance'
# Distance from Dublin calculator
module DistanceFromDublin
  DUBLIN_GPS_LOC = [53.3381985, -6.2592576].freeze
  EARTH_RADIUS_KM = 6371

  # input parameter is an array of GPS latitude and longitude values (degrees)
  def self.to(gps_loc)
    OrthodromicDistance.calculate(DUBLIN_GPS_LOC, gps_loc, EARTH_RADIUS_KM)
  end
end
