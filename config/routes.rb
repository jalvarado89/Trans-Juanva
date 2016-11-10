Rails.application.routes.draw do
  resources :navieras
  root 'default#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :sessions
  resources :num_contenedors
  resources :asignations
  resources :cliente_navieras

  resources :navieras do
    resources :cliente_navieras
  end
  
  resources :planta
  resources :routes
  resources :predios

  resources :companies do
    resources :navieras
  end

  resources :implements
  resources :trucks
  resources :drivers
  resources :users
end