Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update]
  root to: "items#index"
  resources :items do
    resources :deals, only: [:new, :create]
  end
  resources :cards, only: [:new, :create]
end
