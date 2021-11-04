Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :like, only: [:show, :create, :destroy]
  resources :city
  resources :gossips
  resources :user
  resources :comment, except: [:index, :show]
  get 'welcomes/:name', to: 'welcomes#home', as: 'welcome'
  get 'contact/contact'
  get 'team/team'

  root 'gossips#index'
end
