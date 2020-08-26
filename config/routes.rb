Rails.application.routes.draw do
  resources :enrollments
  devise_for :users
  
  resources :courses do
    resources :lessons
    resources :enrollments, only: %i[new create]
  end

  resources :users, only: %i[index edit show update]
  get 'home/activity'
  root 'home#index'
end
