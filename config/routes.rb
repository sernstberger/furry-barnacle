Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :home, only: [:index]
  resources :posts
  resources :destinations
  resources :attractions
  resources :photos
  # devise_for :users

  # scope :admin do
  #   root controller: :base, to: "admin#index"

  #   resources :posts
  # end

end
