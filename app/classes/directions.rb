class Directions

  def initialize(params, session)
    locale = session[:locale] ? 'en' : 'no'
    url = URI("https://maps.googleapis.com/maps/api/directions/json?origin=#{params[:from]}&destination=#{params[:to]}&mode=transit&alternatives=true&language=#{locale}&key=#{ENV['GOOGLE_MAPS_API']}")
    puts url
    @direction = JSON.parse(Net::HTTP.get(url))
  end

  def routes
    @direction['routes'].map { |routes| Routes.new(routes) }
  end
end