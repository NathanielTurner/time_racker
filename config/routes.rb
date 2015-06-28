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
  post '/sessions'
  get '/signin' => 'sessions/new'
  delete '/signout' => 'sessions/destroy'
end
