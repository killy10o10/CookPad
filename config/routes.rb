Rails.application.routes.draw do
  resources :recipe_foods
  resources :foods
  devise_for :users
  get '/public_recipes', to: 'recipes#public'

  root "users#index"

  resources :users

  resources :recipes, only: [:public, :index, :show, :new, :create, :destroy]
  
  # inventories

  resources :inventories do
    resources :inventory_foods, only: %i[ create destroy new]
  end
end
