Rails.application.routes.draw do

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
