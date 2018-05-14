class Routes
  def initialize(routes)
    @routes = routes
  end

  def bounds
    bounds = @routes['bounds']
    { northeast: "#{bounds['lat']},#{bounds['lng']}", southwest: "#{bounds['lat']},#{bounds['lng']}" }
  end

  def legs
    @routes['legs'].map { |legs| Legs.new(legs) }
  end

  def overview_polyline
    line = @routes['overview_polyline']['points']
    Polylines::Decoder.decode_polyline line
  end
end