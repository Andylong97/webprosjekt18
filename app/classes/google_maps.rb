# frozen_string_literal: true

class GoogleMaps
  def initialize(params)
    @travel = params
  end

  def origin
    @travel[:from]
  end

  def destination
    @travel[:to]
  end

  def places(from, to)
    uri = URI("http://reisapi.ruter.no/Travel/GetTravels?fromPlace=#{from}&toPlace=#{to}&isafter=true")
    puts uri
    result = Net::HTTP.get_response(uri)
    JSON.parse(result.body)
  end

  def route_info(stage)
    @proposal = []
    stage.each do |stages|
      @geometry.push(stages['Geometry'])
      if stages['Transportation'].equal? 0
        @proposal.push(::GeoUtm::UTM.new('32N', stages['DeparturePoint']['X'], stages['DeparturePoint']['Y']).to_lat_lon)
        @proposal.push(::GeoUtm::UTM.new('32N', stages['ArrivalPoint']['X'], stages['ArrivalPoint']['Y']).to_lat_lon)
      else
        @proposal.push(::GeoUtm::UTM.new('32N', stages['DepartureStop']['X'], stages['DepartureStop']['Y']).to_lat_lon)
        @proposal.push(::GeoUtm::UTM.new('32N', stages['ArrivalStop']['X'], stages['ArrivalStop']['Y']).to_lat_lon)
      end
    end
    @proposal
  end

  def city_bikes(ip)
    coordinates = JSON.parse(Net::HTTP.get(URI("http://api.ipstack.com/#{ip}?access_key=d6286057971ebd4965e897f642bdb300")))
    center = [coordinates['longitude'], coordinates['latitude']]
    box = Geocoder::Calculations.bounding_box(center, 0.5)
    uri = URI("http://reisapi.ruter.no/Place/GetCityBikeStations?longmin=#{box[0]}&longmax=#{box[2]}&latmin=#{box[1]}&latmax=#{box[3]}")
    puts "http://reisapi.ruter.no/Place/GetCityBikeStations?longmin=#{box[0]}&longmax=#{box[2]}&latmin=#{box[1]}&latmax=#{box[3]}"
    {
      body: JSON.parse(Net::HTTP.get(uri)),
      center: center
    }
  end
end
