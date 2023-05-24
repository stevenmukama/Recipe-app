Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show]
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
    unauthenticated do
      root 'users#index', as: :unauthenticated_root
    end
  end
end
