Rails.application.routes.draw do
  resources :foods
  devise_for :users
  get '/public_recipes', to: 'recipes#public'

  root "users#index"

  resources :users

  resources :recipes, only: [:public, :index, :show, :new, :create, :destroy]
  # inventories

  resources :inventories
end
