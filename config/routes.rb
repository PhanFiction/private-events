Rails.application.routes.draw do
  # devise_for :users, only: [:session, :sign_in, :registration, :sign_out, :password]
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :show] do
    resources :event_attendees, only: [:update]
    put '/join', to: 'posts#join', as: 'join'
    put '/leave', to: 'posts#leave', as: 'leave'
  end

  resources :users do
    resources :events
    member do 
      get :all_events
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "events#index"
end
