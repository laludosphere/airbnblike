Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings
  end
  resources :bookings, only: [] do
    member do 
      patch "accepted"
    end
  end
  resources :bookings, only: [] do
    member do 
      patch "declined"
    end
  end

  resources :flats do 
    resources :reviews, only: [ :new, :create]
  end
  resources :reviews, only:[:destroy]

  get "/all_my_flats", to: "flats#all_my_flats"
  get "/all_my_bookings", to: "bookings#all_my_bookings"
end