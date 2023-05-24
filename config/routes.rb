Rails.application.routes.draw do

  devise_for :users
  resources :recipes do
    resources :recipe_foods, only: [:create, :destroy]
  end
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
