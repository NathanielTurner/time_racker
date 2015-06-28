Rails.application.routes.draw do
  root 'time_entries#new'
  get 'time_entries/new'
  get 'time_entries/index'
  get 'time_entries/create'
  resources :time_entries
  get 'programmers/new'
  get 'programmers/index'
  get 'programmers/create'
  resources :programmers
  get 'projects/new'
  get 'projects/index'
  get 'projects/create'
  resources :projects
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  delete '/signout' => 'sessions#destroy'
  get '/signup' => 'programmers#new'
  resources :sessions
end
