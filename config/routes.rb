Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :profiles
  resources :charges
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#welcome'
  get '/pages/landing_page_login', to: 'pages#landing_page_login'
end
