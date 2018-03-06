Rails.application.routes.draw do
  get  '/categories/:category_id/courses'=> 'categories#show', as: 'category_show'
  resources :courses
  resources :categories

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  unauthenticated do
    root :to => 'static_pages#home'
  end
  authenticated do
    root :to => 'dashboard#index'
  end
  get '/help'=> 'static_pages#help', as: :help
  get '/about' => 'static_pages#about', as: :about
  devise_for :users,
             :path_names => {
                     :sign_in => 'login',
                     :sign_out => 'logout',
                     :password => 'secret',
                     :confirmation => 'verification',
                     :unlock => 'unblock',
                     :registration => 'register',
                     :sign_up => 'cmon_let_me_in' }

end
