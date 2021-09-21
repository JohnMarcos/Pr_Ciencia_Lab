Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :courses do
    collection do
      get 'mis_cursos_creados'
    end
    resources :lessons, except: [:show]
    resources :enrollments, only: [:index, :show, :new, :create] do
      collection do
        get 'mis_cursos_enrrolados'
      end
      resources :lessons do
        get 'mis_lecciones_creadas'
        resources :comments
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
