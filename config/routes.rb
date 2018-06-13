Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, :customer_profiles, :properties

  namespace :admin do
    resources :users, :customer_profiles, :properties
    root 'home#index'
  end

  root 'home#index'
end
