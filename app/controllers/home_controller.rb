# Home Controller
class HomeController < ApplicationController
  def index; end

  def logistic_planner
    maps = ::GoogleMaps.new(params)
    @fra = maps.origin
    @til = maps.destination
    @campus = Location.all
    travel = maps.places
    raise travel.inspect
  end
end
