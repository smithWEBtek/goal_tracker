Rails.application.routes.draw do
  get 'goals/new'
  get 'goals/edit'
  get 'goals/show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'welcome#index'

  resources :users, only: [:new, :create, :show]
end
