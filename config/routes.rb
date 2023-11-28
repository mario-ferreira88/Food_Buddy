Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }


  root to: "pages#landing"

  get "dashboard", to: "pages#dashboard", as: :dashboard

  get "up" => "rails/health#show", as: :rails_health_check


  get "profile", to: "profiles#show"

  resources :profiles, only: [:create, :new, :edit, :update] do
    collection do
      ## profiles/my_profile
      get :my_profile, to: "profiles#my_profile"
    end
  end
end
