Rails.application.routes.draw do

  get 'sessions/new'

  resources :users

  get 'landing/index'
  get 'landing/about'

  root 'landing#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
