Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  authenticated :user do
    # root 'categories#index', as: :authenticated_root
    root "groups#index", as: :authenticated_root
  end

  unauthenticated do
    root "home#index", as: :unauthenticated_root
  end
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :entities, only: [:index, :show, :new, :create, :destroy]
  end
end
