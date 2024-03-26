Rails.application.routes.draw do
  devise_for :users
 
  get 'static_pages/help'
  get '/user_profile' => 'static_pages#user_profile'
  root 'static_pages#home'
  get '/index' => 'static_pages#index'
end
