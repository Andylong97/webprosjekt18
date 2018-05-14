# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  before_action :set_locale

  def index; end

  def logistic_planner
    if params[:from].nil? && params[:to].nil?
      params[:from] = 'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo'
      params[:to] = 'Kirkegata+24,+Oslo'
    end
    @maps = ::GoogleMaps.new(params)
    @directions = Directions.new(params, session)
    @from = []
    Location.where('NOT address LIKE ?', params[:to]).each do |f|
      @from.push(name: f.name, address: f.address)
    end
    @from.push(name: I18n.t('logistics.current_address'), address: "#{request.location.latitude},#{request.location.longitude}")
    @to = []
    Location.where('NOT address LIKE ?', params[:from]).each do |t|
      @to.push(name: t.name, address: t.address)
    end
    @to.push(name: I18n.t('logistics.current_address'), address: "#{request.location.latitude},#{request.location.longitude}")
  end

  def brenneriveien; end

  def fjerdingen; end

  def kvadraturen; end

  def vulkan; end

  def kvadraturenalt
    @bikes = GoogleMaps.new(params).city_bikes(request.location)
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
end
