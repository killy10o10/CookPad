Rails.application.routes.draw do
  resources :foods
  devise_for :users
  get '/public_recipes', to: 'recipes#public'

  root "users#index"

  resources :users

  resources :recipes do
    resources :shopping_lists
    resources :recipe_foods
  end

  # inventories

  resources :inventories do
    resources :inventory_foods, only: %i[ create destroy new]
  end
end
