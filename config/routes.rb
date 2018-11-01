Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :profiles
  resources :charges
  devise_for :users
  
  root to: 'pages#welcome'

  post 'products/search' => 'products#search', as: 'search_products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
