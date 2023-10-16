require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  "/"

  namespace :api do 
    namespace :v1 do 
      resources :users, only: [:create, :index] do 
        resources :lures, only: [:index, :show, :create, :update, :destroy]
        resources :catches, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
  
end
