Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  resources :spaceships, only: %i[index show new create edit update delete] do
    resources :bookings, only: %i[new create]
  end

  get "dashboard", to: "pages#dashboard"
  delete "spaceships/:id", to: "spaceships#delete"

  resources :bookings, only: %i[index show] do
    get "confirm", to: "pages#confirm"
    get "decline", to: "pages#decline"
  end
  devise_for :users
end
