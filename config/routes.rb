Rails.application.routes.draw do
  root "home#show"
  get "dashboard", to: "users#show"
  get "auth/twitter", as: :twitter_login
  get "auth/:provider/callback", to: "sessions#create"

end
