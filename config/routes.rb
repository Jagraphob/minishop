Rails.application.routes.draw do
  get '/signup', to: 'customers#new'
  get '/login', to: 'sessions#new'

  resources :customers

  root 'home#index'
end
