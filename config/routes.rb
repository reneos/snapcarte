Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get "partners", to: "pages#partners"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show, :new, :create, :update] do
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
  resources :cart_items, only: [:destroy]
  resources :dishes, only: [:destroy]
  resources :dashboard, only: [:index]
end
