Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:show, :new, :create] do
    resources :menus, only: [:show, :create, :edit, :update]
  end
  resources :dishes, only: [:create, :update]
  resources :entries, only: :create
  # patch "menus/:id", to "menus#export"
end
