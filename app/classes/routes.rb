class Routes
  def initialize(routes)
    @routes = routes
  end

  def bounds
    bounds = @routes['bounds']
    { northeast: {
      lat: (bounds['northeast']['lat']).to_s,
      lng: (bounds['northeast']['lng']).to_s
    },
      southwest: {
        lat: (bounds['southwest']['lat']).to_s,
        lng: (bounds['southwest']['lng']).to_s
      } }.to_json
  end

  def legs
    @routes['legs'].map { |legs| Legs.new(legs) }
  end

  def overview_polyline
    line = @routes['overview_polyline']['points']
    Polylines::Decoder.decode_polyline line
  end
end