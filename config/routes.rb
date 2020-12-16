Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :user_items, only: [:new, :create, :index]
end
