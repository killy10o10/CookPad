Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  get '/public_recipes', to: 'recipes#public'
  # get '/new_recipe', to 'recipes#new', as: 'new_recipe'

  root "users#index"
  resources :users

  resources :recipes, only: [:public, :index, :show, :new, :create, :destroy]
end
