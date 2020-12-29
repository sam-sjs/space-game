Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  
  get '/game' => 'game#app'

  root to: 'pages#home'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :users
  resources :systems
  resources :planets
  resources :ships
end
