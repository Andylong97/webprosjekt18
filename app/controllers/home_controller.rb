# Home Controller
class HomeController < ApplicationController
  def index

  end

  def logistic_planner
    if params[:from].nil? && params[:to].nil?
      params[:from] = 'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo'
      params[:to] = 'Hoyskolen+Kristiania,+Kirkegata,+Oslo'
    end
    maps = ::GoogleMaps.new(params)
    @campus = Location.all
    @travel = maps.places
  end

  def brenneriveien

  end

  def fjerdingen

  end

  def kvadraturen

  end

  def vulkan

  end

  def kvadraturenalt

  end
end
