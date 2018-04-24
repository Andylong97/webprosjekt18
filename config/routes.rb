Rails.application.routes.draw do
  resources :users
  get '/index', to: 'home#index'

  post '/index', to: 'home#index'

  get '/logistics', to: 'home#logistic_planner'

  post '/logistics', to: 'home#logistic_planner'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
