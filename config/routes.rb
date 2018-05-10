Rails.application.routes.draw do
  resources :categories do
    resources :courses, only: [:index], module: :categories
  end
  resources :courses do
    resources :sections, only: [:index], module: :courses
  end
  resources :courses do
    resource :like, module: :courses, only: [:show]
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
  get '/courses/:id/like_count' => 'courses#like_count', as: :like_count
  post '/create_course' => 'courses#create'
  post '/delete_section/:id' => 'sections#destroy'
  post '/create_section' => 'sections#create'
  post '/create_lesson' => 'lessons#create', format: 'application/json'
  post '/delete_lesson/:id' => 'lessons#destroy'
  post '/create_block' => 'blocks#create', format: 'application/json'
  post '/delete_block/:id' => 'blocks#destroy'
  post '/create_practice' => 'practices#create', format: 'application/json'
  post '/delete_practice/:id' => 'practices#destroy'
  resources :lessons do
      resources :blocks, module: :lessons, only: [:destroy]
  end
end
