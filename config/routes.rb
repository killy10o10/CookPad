Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users
  # inventories
  resources :inventories, only: [:index, :show, :destroy]
end
