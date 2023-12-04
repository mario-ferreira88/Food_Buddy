Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#landing"

  resources :events do
    member do
      post 'add_group'
    end
  end

  resources :groups do
    resources :user_groups, only: %i[create destroy], path: 'users', controller: 'user_groups'
  end

  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :profiles, only: %i[create new edit update destroy] do
    collection do
      ## profiles/my_profile
      get :my_profile, to: "profiles#my_profile"
    end
  end

  resources :categories, only: %i[index show edit update]
end
