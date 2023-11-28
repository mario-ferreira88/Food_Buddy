Rails.application.routes.draw do
  devise_for :users

  root to: "pages#landing"

  get "dashboard", to: "pages#dashboard", as: :dashboard

  get "up" => "rails/health#show", as: :rails_health_check

  resources :profiles, only: [:create, :new, :edit, :update] do
    collection do
      ## profiles/my_profile
      get :my_profile, to: "profiles#my_profile"
    end
  end
end
