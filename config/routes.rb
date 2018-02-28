Rails.application.routes.draw do
  unauthenticated do
    root :to => 'static_pages#home'
  end
  authenticated do
    root :to => 'dashboard#index'
  end
  get '/home' => 'static_pages#home', as: 'helf'
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
