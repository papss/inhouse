Rails.application.routes.draw do

  resources :invites
  resources :leagues
  root 'landing#index'

  get 'landing/index'
  get 'landing/about'

  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'

  get    '/signup',             to: 'users#new'
  get    '/signup',             to: 'users#create'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
