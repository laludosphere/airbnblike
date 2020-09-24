Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookings, only: [:index, :show, :destroy]
  resources :flats do
    resources :bookings, only: [:new, :create]
  end



  
  get "my_flats", to: "flats#my_flats"
  get "all_my_bookings", to: "bookings#all_my_bookings"
end