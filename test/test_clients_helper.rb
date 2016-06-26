require 'minitest/autorun'
require 'client'
require 'clients_helper'

class TestClientsHelper < Minitest::Test
  LOC_LONDON = [51.5074, -0.1278].freeze
  DIST_DUBLIN_TO_LONDON_KM = 463

  def test_close_to_dublin
    client = Client.new(1, 'From London', LOC_LONDON)
    assert ClientsHelper.close_to_dublin?(client, DIST_DUBLIN_TO_LONDON_KM + 1)
    assert !ClientsHelper.close_to_dublin?(client, DIST_DUBLIN_TO_LONDON_KM - 1)
  end

  def test_sorting
    clients = [
      Client.new(100, 'C1', [0.0, 0.0]),
      Client.new(1, 'C2', [50.0, -1.0]),
      Client.new(10, 'C3', [51.0, -0.5])
    ]

    sorted_clients = ClientsHelper.sort_by_id(clients)

    assert_equal sorted_clients[0], clients[1]
    assert_equal sorted_clients[1], clients[2]
    assert_equal sorted_clients[2], clients[0]
  end
end
