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

  def brenneriveien; end

  def fjerdingen; end

  def kvadraturen; end

  def vulkan; end

  def kvadraturenalt
    # @bikes = GoogleMaps.new(params).city_bikes(session[:latlong])
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
    raise params[:latlong].inspect
    session[:latlong] = params[:latlong]
  end
end
