Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :profiles
  resources :charges
  devise_for :users, controllers: { registrations: 'registrations' }
  # resources :users, only: [:show, :edit, :update]
  
  root to: 'pages#welcome'

  post 'products/search' => 'products#search', as: 'search_products'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#welcome'
  get '/pages/landing_page_login', to: 'pages#landing_page_login'
  get '/pages/about_us', to: 'pages#about_us'
  get '/account/:id', to: 'pages#account'

  resources :conversations do
    resources :messages
  end

get '/conversations', to: 'conversation#index'
get '/conversations/messages/new', to: 'messages#new'
post '/conversations/messages/new', to: 'messages#create'
get '/conversations/conversation_params[:id]/messages', to: 'messages#show'
end
