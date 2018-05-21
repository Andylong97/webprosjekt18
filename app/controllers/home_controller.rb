# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  before_action :set_locale

  def index
  end

  def logistic_planner
    if params[:from].nil? && params[:to].nil?
      params[:from] = 'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo'
      params[:to] = 'Kirkegata+24,+Oslo'
    end
    @maps = ::GoogleMaps.new(params)
    @directions = Directions.new(params, session[:locale])
    @from = Location.all_except(params[:to])
    @to = Location.all_except(params[:from])
    @all = Location.all
  end

  def fjerdingen
    @bikes = GoogleMaps.new(params).city_bikes({ lat: 59.916114, long: 10.759968 })
    @campus = 'Fjerdingen'
  end

  def kvadraturen
    @bikes = GoogleMaps.new(params).city_bikes({lat: 59.9111398, long: 10.7450366})
    @campus = 'Kvadraturen'
  end

  def vulkan
    @bikes = GoogleMaps.new(params).city_bikes({ lat: 59.923312, long: 10.752354 })
    @campus = 'Vulkan'
  end

  def change_locale
    locale = params[:id]
    raise 'unsupported locale' unless %w[en nb].include?(locale)
    session[:locale] = locale
    redirect_back(fallback_location: root_path)
  end

  def set_locale
    I18n.locale = session[:locale]
  end

  def set_location
    session[:latlong] = params[:latlong]
  end
end
