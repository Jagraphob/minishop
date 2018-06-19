Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  namespace :signup do
    resources :customers, :only => [:show, :new, :create] do
      resources :users, :only => [:show, :new, :create] 
      resources :properties, :only => [:new, :create]
    end
  end
  
  namespace :admin do
    resources :users, :properties
    root 'home#index'
  end

  root 'home#index'
end
