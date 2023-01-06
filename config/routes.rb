Rails.application.routes.draw do
  resources :foods
  devise_for :users
  root "users#index"

  resources :users
  # inventories

  resources :inventories do
    resources :inventory_foods, only: %i[ create destroy new]
  end
end
