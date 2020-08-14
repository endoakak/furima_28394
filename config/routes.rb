Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show, :update]
  root to: "items#index"
  resources :items do
    resources :deals, only: [:new, :create]
  end
end
