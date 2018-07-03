Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :customers

  namespace :signup do
    resources :customers, :only => [:show, :new, :create] do
      resources :users, :only => [:new, :create] 
      resources :properties, :only => [:new, :create]
    end
  end
  
  namespace :admin do
    resources :customers
    resources :properties do
      resources :register_serials, :only => [:create, :edit, :destroy]
    end

    resources :ownerships
    resources :users
    root 'home#index'
  end
  root 'home#index'
end
