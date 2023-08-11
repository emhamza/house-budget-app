Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Resourceful routes for Balances and nested Items
  resources :balances, only: [:index, :show, :new, :create] do
    resources :items, only: [:new, :create]
  end

  # Root route
  root 'balances#index'

  # Custom route for the home page
  get '/home', to: 'home#index'
end
