class GoogleMaps
  def initialize(params)
    @travel = params
  end

  def origin
    #translate_travel(@travel[:from])
    @travel[:from]
  end

  def destination
    @travel[:to]
    #translate_travel(@travel[:to])
  end

  def places
    # uri = URI('http://reisapi.ruter.no/Travel/GetTravels?fromPlace=3010512&toPlace=3010513&isafter=true')
    key = 'AIzaSyDeuhvsD4Oh7u3UNHNmrdtLvlDpdg1uygE'
    uri = URI("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&mode=transit&key=#{key}")
    result = Net::HTTP.get(uri)
    JSON.parse(result)
  end

  def stops
    stopURI = URI('http://reisapi.ruter.no/Place/GetStopsRuter')
    stops = Net::HTTP.get_response(stopURI)
    stop = JSON.parse(stops.body)
  end

  private

  def translate_travel(travel)
    case travel
    when 'fjerdingen'
      'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo'
    when 'vulkan'
      'vulkan+oslo'
    when 'brennerivegen'
      'Brenneriveien+9,+Oslo'
    when 'kvadraturen'
      'Høyskolen+Kristiania,+Kirkegata,+Oslo'
    else
      'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo'
    end
  end
end

# stopID:Int name:String short_name:String zone:String district:String

