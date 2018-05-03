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
    result = Net::HTTP.get_response(uri)
    JSON.parse(result.body)
  end

  def stops
    stopURI = URI('http://reisapi.ruter.no/Place/GetStopsRuter')
    stops = Net::HTTP.get_response(stopURI)
    stop = JSON.parse(stops.body)
  end
end
