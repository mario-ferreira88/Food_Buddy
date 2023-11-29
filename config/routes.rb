Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#landing"

  resources :events

  resources :groups

  get "dashboard", to: "pages#dashboard", as: :dashboard

  get "profile", to: "profiles#show"

  resources :profiles, only: [:create, :new, :edit, :update] do
    collection do
      ## profiles/my_profile
      get :my_profile, to: "profiles#my_profile"
      patch :my_profile, to: "profiles#update"
      get :my_profile_edit, to: "profiles#edit"
    end
  end
end
