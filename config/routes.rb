Rails.application.routes.draw do
  resources :bookings
  resources :boards
  devise_for :users
  root to: 'boards#index'

  get '/profile', to: 'pages#profile', as: :user_profile
  get '/profile/boards', to: 'pages#boards', as: :user_boards
  get '/profile/bookings', to: 'pages#bookings', as: :user_bookings


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
