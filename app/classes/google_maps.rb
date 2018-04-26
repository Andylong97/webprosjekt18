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