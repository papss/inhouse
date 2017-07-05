Rails.application.routes.draw do

  # concerns:
  concern :members do
    resources :league_users
  end

  # resource routes:
  resources :users,             concerns: :members
  resources :leagues,           concerns: :members

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

  root 'landing#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
