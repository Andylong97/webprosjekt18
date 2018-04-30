# Home Controller
class HomeController < ApplicationController
  def index

  end

  def logistic_planner
    maps = ::GoogleMaps.new(params)
    @fra = maps.origin
    @til = maps.destination
    @campus = Location.all
    @travel = maps.places
  end

  def route_info
    render partial: 'home/route_info'
  end

  def brenneriveien

  end

  def fjerdingen

  end

  def kvadraturen

  end

  def vulkan

  end
end
