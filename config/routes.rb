Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'slots/remove_bike'
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trips, only: [:index]
      post 'trips/start_trip/',  to: 'stations#start_trip',  as: :start_trip
      post 'trips/finish_trip/', to: 'stations#finish_trip', as: :finish_trip
      
      get 'users/show'
      get 'users/my_trips'
      get 'stations/',         to: 'stations#index',         as: :list_stations
      get 'stations/show'
      # get 'stations/available_slots'
      # get 'stations/not_avaiable_slots'
    end
  end
  
  # get 'stations/index'

  # get 'bikes/index'

  # get 'users/index'

  # get 'users/user_trips'

  # get 'trips/index'
end
