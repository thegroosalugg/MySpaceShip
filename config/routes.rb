Rails.application.routes.draw do
  resources :spaceships, only: %i[index]

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :spaceship, only: %i[index]
end
