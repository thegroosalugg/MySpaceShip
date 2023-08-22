Rails.application.routes.draw do

  resources :spaceships, only: %i[index show new create edit update]

  get 'bookings/new'
  get 'bookings/create'
  
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings, only: %i[new create]
  # Defines the root path route ("/")
  # root "articles#index"
end
