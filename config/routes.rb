Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  "/"

  namespace :api do 
    namespace :v1 do 
      resources :users, only: [:create] do 
        resources :lures, only: [:index, :show, :create, :update, :destroy]
        resources :fish, only: [:index, :show]
      end
    end
  end
  
end
