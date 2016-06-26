require 'orthodromic_distance'
# some required business-logic
class ClientsHelper
  DUBLIN_GPS_LOC = [53.3381985, -6.2592576].freeze
  EARTH_RADIUS_KM = 6371

  def self.close_to_dublin?(client, limit)
    distance = OrthodromicDistance.calculate(
      DUBLIN_GPS_LOC,
      client.location,
      EARTH_RADIUS_KM
    )

    distance < limit
  end

  def self.sort_by_id(clients)
    clients.sort_by(&:id)
  end
end
