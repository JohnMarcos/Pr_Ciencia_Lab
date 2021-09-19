Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :courses, only: [:index, :show] do
    resources :lessons
    resources :enrollments, only: [:index, :show, :new, :create] do
      resources :lessons do
        resources :comments
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
