Rails.application.routes.draw do
  devise_for :users

  root to: "pages#landing"

  get "dashboard", to: "pages#dashboard", as: :dashboard

  get "up" => "rails/health#show", as: :rails_health_check

  get "profile", to: "profiles#show"

  # Defines the root path route ("/")
  # root "posts#index"
end
