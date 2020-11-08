Rails.application.routes.draw do
  root 'sessions#home'

  get "/auth/:provider/callback" => 'sessions#google'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout' => 'sessions#destroy'

  resources :comments
  resources :users do
    resources :posts, only: [:new, :create, :index]
  end
  resources :posts do
    resources :comments, only: [:new, :create, :index, :show]
  end



end
