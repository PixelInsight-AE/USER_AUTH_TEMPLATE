Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :tarots
    resources :cards
    resources :users, only: [:create, :index]

    

    post "/login", to: "users#login"

  end
end
