class HomeController < ApplicationController
  def index
     @fra = params[:fra]
     @til = params[:til]
  end
end
