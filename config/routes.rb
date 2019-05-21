Rails.application.routes.draw do

  post '/comments', to: 'comments#create'

  root to: 'recipes#index'
  post '/recipes/filter', to: 'recipes#filter'

  get '/mycookbook', to: 'favourites#index'

  get '/users/find', to: 'users#find'

  get 'sessions/new'

  get '/ingredients/:id/new', to: 'ingredients#new'
  post '/ingredients/:id', to: 'ingredients#create'

  get '/steps/:id/new', to: 'steps#new'
  post '/steps/:id', to: 'steps#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :recipes do
    resources :likes
    resources :favourites
  end
end
