# config/routes.rb
Rails.application.routes.draw do
  get "notifications/index"
  get "users/show"
  root 'moments#index' 

  resources :moments, only: [:index, :show]
  resources :users, only: [:show]
  resources :notifications, only: [:index] 
end
