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
    @from = %w[fjerdingen vulkan kvadraturen brennerivegen]
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
