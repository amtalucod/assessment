Rails.application.routes.draw do
  devise_for :users
 
  get 'static_pages/help'
  root 'static_pages#home'
  get '/index' => 'static_pages#index'
  get '/user_profile/:id', to: 'static_pages#user_profile', as: 'user_profile'
  delete '/users/:id', to: 'registrations#destroy', as: 'delete_user'
  get '/signup', to: 'registration#new'
  
  #devise_for :users, controllers: {
  #imageuser: 'users/imageuser'
  #}
end
