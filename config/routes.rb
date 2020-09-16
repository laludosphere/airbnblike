Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
  resources :flats do 
    resources :reviews, only: [ :new, :create]
  end
  resources :reviews, only:[:destroy]
end