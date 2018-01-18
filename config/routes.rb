Rails.application.routes.draw do
  get 'booking_theatres/index'
  resources :booking_theatres
  resources :audi_screens
  resources :customers
  resources :seat_types
  resources :movies
  resources :show_times
  resources :tickets
end
