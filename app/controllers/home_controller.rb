# Home Controller
class HomeController < ApplicationController
  def index
    maps = ::GoogleMaps.new(params)
    @fra = maps.origin
    @til = maps.destination
  end

  def logistic_planner
    maps = ::GoogleMaps.new(params)
    @fra = maps.origin
    @til = maps.destination
  end
end
