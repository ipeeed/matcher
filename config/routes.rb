Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'signin-owner', to: 'owners#new'
  resources :owners, only: [:index, :show, :create, :edit, :update, :destroy]
  get 'signin-transporter', to: 'transporters#new'
  resources :transporters, only: [:index, :show, :create, :edit, :update, :destroy]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
