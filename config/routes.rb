Rails.application.routes.draw do
  root "reservations#index"

  resources :users
  resources :reservations
end