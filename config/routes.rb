Rails.application.routes.draw do
  root "home#show"

  get "dashboard", to: "users#show"

  get "feed", to: "feed#show"
  resources :pets, only: [:index, :show, :create]

  get "auth/twitter", as: :twitter_login
  get "auth/:provider/callback", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
