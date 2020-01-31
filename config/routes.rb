Rails.application.routes.draw do

  get '/home' => 'home#index'

  resources :movies
  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new', as: 'signup'
  post '/users' => 'users#create'

  root :to => "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
