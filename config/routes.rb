Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: "pages#landing"

  get "dashboard", to: "pages#dashboard", as: :dashboard


  resources :profiles, only: %i[create new edit update destroy] do
    collection do
      ## profiles/my_profile
      get :my_profile, to: "profiles#my_profile"
    end
  end
end
