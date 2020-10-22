Rails.application.routes.draw do
  root :to => 'pages#index'
  resources :posts
  resources :replies

  resources :users, :only => [:new, :show, :create, :index, :edit, :update]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :groups
  post "/groups/join" => 'groups#join'

end
