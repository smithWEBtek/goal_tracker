Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'welcome#index'

  resources :users, only: [:new, :create, :show]

  resources :goals, except: [:index], shallow: true do
    resources :tasks, except: [:index]
  end

  patch '/goals/:id/complete', to: 'goals#complete', as: 'complete_goal'
  patch '/goals/:id/incomplete', to: 'goals#incomplete', as: 'incomplete_goal'

  patch '/tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
  patch '/tasks/:id/incomplete', to: 'tasks#incomplete', as: 'incomplete_task'
end
