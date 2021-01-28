Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[new create destroy]
  resources :users, only:  %i[new create destroy show]
  resources :transactions
  resources :groups
  resources :transacts
  root to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
