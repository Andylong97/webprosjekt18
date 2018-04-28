class GoogleMaps
  def initialize(params)
    @travel = params
  end

  def origin
    translate_travel(@travel[:fra])
  end

  def destination
    translate_travel(@travel[:til])
  end

  def places
    uri = URI('http://reisapi.ruter.no/Travel/GetTravels?fromPlace=3010011&toPlace=3010012&isafter=true')
    result = Net::HTTP.get_response(uri)
    travel = JSON.parse(result.body)
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
