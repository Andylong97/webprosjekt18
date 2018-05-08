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

  def stops
    stopURI = URI('http://reisapi.ruter.no/Place/GetStopsRuter')
    stops = Net::HTTP.get_response(stopURI)
    stop = JSON.parse(stops.body)
  end

  def route_info(stage)
    @proposal = []
    stage.each do |stages|
      @geometry.push(stages['Geometry'])
      if stages['Transportation'].equal? 0
        @proposal.push(::GeoUtm::UTM.new('32N', stages['DeparturePoint']['X'], stages['DeparturePoint']['Y'],).to_lat_lon)
        @proposal.push(::GeoUtm::UTM.new('32N', stages['ArrivalPoint']['X'], stages['ArrivalPoint']['Y']).to_lat_lon)
      else
        @proposal.push(::GeoUtm::UTM.new('32N', stages['DepartureStop']['X'], stages['DepartureStop']['Y']).to_lat_lon)
        @proposal.push(::GeoUtm::UTM.new('32N', stages['ArrivalStop']['X'], stages['ArrivalStop']['Y']).to_lat_lon)
      end
    end
    @proposal
  end

  def geometry(stage)
    @geometry = []
    stage.each do |stages|
      @geometry.push(stages['Geometry'])
    end
    @geometry
  end
end
