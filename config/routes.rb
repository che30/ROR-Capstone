Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only:  %i[new create show]
  get '/transactions/no-grp', to: 'transactions#no_grp'
  get '/users/homepage', to: 'users#homepage'
  resources :transactions
  resources :groups
  resources :transacts
  root to: 'users#homepage'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
