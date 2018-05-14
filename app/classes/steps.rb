class Steps
  def initialize(step)
    @step = step
  end

  def instruction
    @step['html_instructions']
  end

  def mode
    @step['travel_mode']
  end

  def arrival_stop
    @step['transit_details']['arrival_stop']['name']
  end

  def departure_stop
    @step['transit_details']['departure_stop']['name']
  end

  def duration
    @step['duration']['text']
  end

  def distance
    @step['distance']['text']
  end

  def departure_time
    Time.parse(@step['transit_details']['departure_time']['text']).strftime('%H:%M')
  end

  def arrival_time
    Time.parse(@step['transit_details']['arrival_time']['text']).strftime('%H:%M')
  end

  def short_name
    @step['transit_details']['line']['short_name']
  end

  def headsign
    @step['transit_details']['headsign']
  end

  def number_of_stops
    @step['transit_details']['num_stops']
  end

  def transit?
    @step['transit_details'].nil?
  end

  def vehicle
    @step['transit_details']['line']['vehicle']['type']
  end

  def instructions
    @step['steps'].map { |step| Instructions.new(step) }
  end

  def polyline
    @step['polyline']['points']
  end
end