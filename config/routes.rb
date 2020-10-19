Rails.application.routes.draw do
  root :to => 'posts#index'
  resources :posts do
    resources :replies
  end
  resources :users, :only => [:new, :show, :create, :index, :edit, :update]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :groups
end
