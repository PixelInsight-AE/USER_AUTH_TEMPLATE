Rails.application.routes.draw do
  resources :tarots
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :cards
    resources :users, only: [:create, :index]

    

    post "/login", to: "users#login"

  end
end
