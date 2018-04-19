# Home Controller
class HomeController < ApplicationController
  def index
    maps = ::GoogleMaps.new(params)
    @fra = maps.origin
    @til = maps.destination
  end
end
