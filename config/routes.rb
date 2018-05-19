Rails.application.routes.draw do
  resources :categories do
    resources :courses, only: [:index], module: :categories
  end

  resources :categories
  resources :sections
  resources :lessons
  resources :blocks
  resources  :practices

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  unauthenticated do
    root to: 'static_pages#home'
  end
  authenticated do
    root to: 'dashboard#index'
  end
  get '/help' => 'static_pages#help', as: :help
  get '/about' => 'static_pages#about', as: :about
  devise_for :users,
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'secret',
               confirmation: 'verification',
               unlock: 'unblock',
               registration: 'register', only: %i[new create edit update]
             }
  get '/users/:id/profile' => 'users#show', as: :user_profile

  post '/delete_section/:id' => 'sections#destroy'
  post '/create_section' => 'sections#create'
  post '/create_lesson' => 'lessons#create', format: 'application/json'
  post '/delete_lesson/:id' => 'lessons#destroy'

  resources :lessons do
      resources :blocks, module: :lessons, only: [:destroy,:create]
  end
  resources :practices, module: :lessons, only: [:destroy,:create,:update]
  resources :answers, only: [:destroy,:create,:new]


  resources :courses do
    resources :sections, only: [:index], module: :courses
    resource :like, module: :courses, only: [:show]
    resources :studies, controller: 'studies/courses',only:[:show]
    resources :studies, controller: 'studies',only:[:new]
  end

end
