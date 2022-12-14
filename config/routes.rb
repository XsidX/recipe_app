# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "public_recipes#index"

  get "/public_recipes", to: "public_recipes#index"


  resources :foods, except: [:edit, :update]

  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update]
  resources :recipe_foods, only: [:create, :update]

  get "/general_shopping_list", to: "general_shopping_list#index"

end
