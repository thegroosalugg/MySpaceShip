Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get 'dashboard', to: 'pages#dashboard'

  root to: "pages#home"
  resources :spaceships, only: %i[index show new create edit update] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show]
  devise_for :users
end
