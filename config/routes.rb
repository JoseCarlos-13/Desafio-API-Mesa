Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', 
  controllers: { 
    registrations: 'registrations', 
    sessions: 'sessions' 
  }

  resources :places
  resources :users
  resources :reviews
end
