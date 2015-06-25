Rails.application.routes.draw do
  root 'time_entries#new'
  get 'time_entries/new'
  get 'time_entries/index'
  get 'time_entries/create'
  resources :time_entries
end
