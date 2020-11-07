Rails.application.routes.draw do
  root 'sessions#home'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :comments
  resources :users
  resources :posts
end
