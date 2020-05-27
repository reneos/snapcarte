Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:show, :new, :create] do
    resources :menus, only: [:show, :create, :edit, :update]
    resources :dashboards, only: [:index]
  end
  resources :menus, only: [] do
    resources :dishes, only: [:update]
  end
  resources :dishes, only: [:create, :destroy]
  resources :entries, only: :create
end

