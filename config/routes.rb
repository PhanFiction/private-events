Rails.application.routes.draw do
  devise_for :users, only: [:session, :sign_in, :registration, :sign_out, :password]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :events

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "event#index"
end