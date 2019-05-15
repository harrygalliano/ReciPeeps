Rails.application.routes.draw do

  root to: 'users#new'

  get '/ingredients/:id/new', to: 'ingredients#new'
  post '/ingredients/:id', to: 'ingredients#create'

  get '/steps/:id/new', to: 'steps#new'
  post '/steps/:id', to: 'steps#create'

  resources :recipes, :users
end
