class Legs
  def initialize(legs)
    @legs = legs
  end

  def arrival_time
    @legs['arrival_time']
  end

  def departure_time
    @legs['departure_time']
  end

  def distance
    @legs['distance']['text']
  end

  def duration
    @legs['duration']['text']
  end

  def end_address
    @legs['end_address'].gsub(/\d{4}| Norway/, '').gsub(/,$/, '')
  end

  def end_location
    { lat: @legs['end_location']['lat'], lng: @legs['end_location']['lng'] }
  end

  def start_address
    @legs['start_address'].gsub(/\d{4}| Norway/, '').gsub(/,$/, '')
  end

  def start_location
    { lat: @legs['start_location']['lat'], lng: @legs['start_location']['lng'] }
  end

  def steps
    @legs['steps'].map { |steps| Steps.new(steps) }
  end
end