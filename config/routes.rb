Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :home, only: [:index]
  resources :posts, only: [:index, :show]
  resources :destinations, only: [:index, :show]
  resources :attractions, only: [:index, :show]
  resources :photos, only: [:index, :show]
  resources :planners, only: [:index, :show]

  namespace :admin do
    root 'dashboard#index'
    resources :dashboard, only: [:index]
    resources :posts, except: [:show]
    resources :destinations, except: [:show]
    resources :attractions, except: [:show]
    resources :photos, except: [:show]
    resources :users, except: [:show]
    resources :planners, except: [:show]
  end

  # scope :admin do
  #   root controller: :base, to: "admin#index"

  #   resources :posts
  # end

end
