Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trips, only: [:index]
      post 'trips/start_trip/',  to: 'trips#start_trip',  as: :start_trip
      post 'trips/finish_trip/', to: 'trips#finish_trip', as: :finish_trip
      
      get 'users/my_trips'
      get 'stations/',         to: 'stations#index',         as: :list_stations
    end
  end
  
end
