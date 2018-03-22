Rails.application.routes.draw do
  get 'stations/index'

  get 'bikes/index'

  get 'users/index'

  get 'users/user_trips'

  get 'trips/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
