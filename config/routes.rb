Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "index#index"
  get '/archive',action: :index,controller: 'archive'
  get '/about',action: :index ,controller:'about'
  get '/post',action: :index,controller:'post'
  
  resources :tag
  
end
