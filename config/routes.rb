Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :customers do
    resources :users, :properties
  end

  namespace :admin do
    resources :users, :properties
    root 'home#index'
  end

  root 'home#index'
end
