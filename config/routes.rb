Rails.application.routes.draw do
  root "welcome#home"
  resources :users, only: [:new, :destroy, :edit, :show, :index, :update]
  post '/users' => 'users#create'

  resources :attractions
  post '/attractions/:id' => 'attractions#create_ride'

  get '/signin' => 'sessions#new', as: 'sign_in'
  post '/signin' => 'sessions#create'

  delete '/sign_out' => 'sessions#destroy', as: 'sign_out'


end
