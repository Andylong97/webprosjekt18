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

  def places
    #key = 'AIzaSyDeuhvsD4Oh7u3UNHNmrdtLvlDpdg1uygE'
    #uri = URI("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&mode=transit&key=#{key}")
    uri = URI('http://reisapi.ruter.no/Travel/GetTravels?fromPlace=3010512&toPlace=3010513&isafter=true')
    result = Net::HTTP.get(uri)
    JSON.parse(result)
  end

  def stops
    stopURI = URI('http://reisapi.ruter.no/Place/GetStopsRuter')
    stops = Net::HTTP.get_response(stopURI)
    stop = JSON.parse(stops.body)
  end
end
