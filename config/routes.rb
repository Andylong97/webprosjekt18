# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  get '/index', to: 'home#index'

  post '/index', to: 'home#index'

  get '/fjerdingen', to: 'home#fjerdingen'

  post '/fjerdingen', to: 'home#fjerdingen'

  get '/kvadraturen', to: 'home#kvadraturen'

  post '/kvadraturen', to: 'home#kvadraturen'

  get '/vulkan', to: 'home#vulkan'

  post '/vulkan', to: 'home#vulkan'

  get '/logistics', to: 'home#logistic_planner'

  post '/logistics', to: 'home#logistic_planner'

  get '/route_info', to: 'home#route_info'

  post '/route_info', to: 'home#route_info'

  get '/locale', to: 'home#change_locale'

  get '/set_location', to: 'home#set_locale'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
