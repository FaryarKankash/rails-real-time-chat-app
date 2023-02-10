Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#signpage"
  resources :users, only: [:new, :create]
  resources :rooms, only: [:index, :show]
  resources :messages, only: [:create]

  get "/sign", to: "users#signpage"
  post "/sign", to: "users#sign"
end
