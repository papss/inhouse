Rails.application.routes.draw do

  resources :invites
  resources :leagues
  resources :users
  resources :league_users 

  # session routes:
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'

  # sign-up routes:
  get    '/signup',             to: 'users#new'
  get    '/signup',             to: 'users#create'

  # non-controller pages:
  get 'landing/index'
  get 'landing/about'

  root 'landing#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
