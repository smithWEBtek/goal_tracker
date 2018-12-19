Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'welcome#index'

  resources :users, only: [:new, :create, :show], shallow: true do
    resources :goals, except: [:index]
  end
end
