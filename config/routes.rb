Rails.application.routes.draw do
  get '/user', to: 'user#index'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, path: '', path_names: { 
    sign_in: 'login', 
    sign_out: 'logout', 
    sign_up: 'signup' 
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
 
  namespace :api do
    namespace :v1 do
      resources :voices
      resources :journals
    end
  end
end
