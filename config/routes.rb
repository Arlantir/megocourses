Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :users, only: %i[index]
  root 'home#index'
end
