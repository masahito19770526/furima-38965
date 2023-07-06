
Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :purchases, only: [:index, :create]
  end

  resources :users, only: [:show, :edit, :update, :destroy]
end
