Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :users, only: [:show, :update]
  resources :items do
    resources :deals, only: [:new, :create]
    resources :comments, only: [:create, :destroy]
  end
  resources :cards, only: [:new, :create]
end
