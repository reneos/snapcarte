Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:show, :new, :create, :update] do
    resources :menus, only: [:create, :edit, :update]
    resources :carts, only: [:show, :create, :edit, :update]
    member do
      get 'edit_menus'
    end
  end
  resources :menus, only: [] do
    resources :dishes, only: [:update]
  end
  resources :dishes, only: [:destroy]
  resources :dashboard, only: [:index]
  #routes orders

end
