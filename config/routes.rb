Rails.application.routes.draw do

  root to: "posts#index"

  resources :posts
  resources :destinations
  resources :attractions
  # devise_for :users

  # scope :admin do
  #   root controller: :base, to: "admin#index"

  #   resources :posts
  # end

end
