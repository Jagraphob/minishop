Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :customer_profiles
  resources :users
  resources :properties

  root 'home#index'
end
