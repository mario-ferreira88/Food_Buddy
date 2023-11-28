Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: "pages#landing"

  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :profiles, only: [:create, :new, :edit, :update] do
    collection do
      ## profiles/my_profile
      get :my_profile, to: "profiles#my_profile"
      patch :my_profile, to: "profiles#update"
      get :my_profile_edit, to: "profiles#edit"
    end
  end
end
