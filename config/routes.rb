Rails.application.routes.draw do
  get '/signup', to: 'customers#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :customers

  root 'home#index'
end
