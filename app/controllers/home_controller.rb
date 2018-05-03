# Home Controller
class HomeController < ApplicationController
  before_action :set_locale

  def index

  end

  def logistic_planner
    if params[:from].nil? && params[:to].nil?
      params[:from] = 'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo'
      params[:to] = 'Hoyskolen+Kristiania,+Kirkegata,+Oslo'
    end
    maps = ::GoogleMaps.new(params)
    @from = Location.where('NOT address LIKE ?', params[:to])
    @to = Location.where('NOT address LIKE ?', params[:from])
    @travel = maps.places(Location.find_by(address: params[:from]).stop_id, Location.find_by(address: params[:to]).stop_id)
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

  def change_locale
    locale = params[:id]
    raise 'unsupported locale' unless ['en', 'nb'].include?(locale)
    session[:locale] = locale
    redirect_back(fallback_location: root_path)
  end

  def set_locale
    I18n.locale = session[:locale]
  end

end
