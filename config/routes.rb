Rails.application.routes.draw do
  # post "/recipe_foods", to: "recipe_foods#create"
  post "/recipe_foods/", to: "recipe_foods#create"
  #resources :recipe_foods
  resources :foods
  get "general_shopping_list", to: "general_shopping_list#index"
  get "public_recipes", to: "public_recipes#index"

  devise_for :users
  # resources :recipes do
  #   resources :recipe_foods
  # end
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :show, :edit, :update]
  end
  resources :foods
  get "public_recipes", to: "public_recipes#index"

  resources :users
  devise_scope :user do
    authenticated :user do
      root 'recipes#index', as: :authenticated_root
    end
    unauthenticated do
      root 'recipes#index', as: :unauthenticated_root
    end
  end
end
