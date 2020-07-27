Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :users, only: %i[index]
  get 'home/activity'
  root 'home#index'
end
