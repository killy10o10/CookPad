Rails.application.routes.draw do
  get 'inventory_shoppings/index'
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

  get '/shopping_list', to: 'inventory_shoppings#index', as: :shopping
  get '/shopping_list?recipe_id=:id&inventory_id=:id', to: 'inventory_shoppings#index', as: :inventory_shopping_list

end
