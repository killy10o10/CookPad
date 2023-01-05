Rails.application.routes.draw do
  resources :foods
  get 'users/index'
  devise_for :users

  root "users#index"
  resources :users
end
