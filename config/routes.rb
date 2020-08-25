Rails.application.routes.draw do
  resources :enrollments
  devise_for :users
  
  resources :courses do
    resources :lessons
  end

  resources :users, only: %i[index edit show update]
  get 'home/activity'
  root 'home#index'
end
