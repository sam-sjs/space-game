Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  resources :systems
  resources :planets
  resources :ships
end
