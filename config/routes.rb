Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:show, :new, :create, :update] do
    resources :menus, only: [:create, :edit, :update]
    # resources :carts, only: [:create, :edit, :update, :add, :remove, :empty, :total]
    resources :carts, only: [:update] do
      member do
        patch 'add_to'
      end
    end
    member do
      get 'edit_menus'
      patch 'update_menus'
    end
  end
  resources :carts, only: [:update]
  resources :menus, only: [] do
    resources :dishes, only: [:update]
  end
  resources :dishes, only: [:destroy]
  resources :dashboard, only: [:index]
end
