Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :customers do
    resources :properties, :only => [:show] do 
      resources :meters, :only => [:update] do
        resources :meter_reading, :only => [:create]
      end
    end
  end

  namespace :signup do
    resources :customers, :only => [:show, :new, :create] do
      resources :users, :only => [:new, :create] 
      resources :properties, :only => [:new, :create]
    end
  end
  
  namespace :admin do
    resources :prices
    resources :customers, :only => [:index, :show]
    resources :users, :only => [:index]
    resources :ownerships, :only => [:update]
    resources :properties, :only => [:index, :show, :update] do
      resources :register_serials, :only => [:create, :edit, :destroy]
      resources :meters, :only => [:update] do
        resources :meter_readings, :only => [:create]
      end
    end

    resources :prices
    root 'home#index'
  end

  root 'home#index'
end
