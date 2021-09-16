Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: [:new, :create]
    resources :lessons, only: [:new, :create] do
      resources :comments, only: [:new, :create]
    end
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
