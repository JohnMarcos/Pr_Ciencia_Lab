Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :lessons, only: [:index, :show] do
    resources :comments, only: [:new, :create]
  end
  resources :courses, only: [:index, :show] do
    resources :lessons, only: [:new, :create]
    resources :enrollments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
