Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "index#index"
  resources :tag
  resources :post
  get '/archive',action: :index,controller: 'archive'
  get '/about',action: :index ,controller:'about'
  get '/post',action: :index,controller:'post'
  get '/add/post', action: :post_add,controller:'post'
  get '/all/post',action: :show ,controller:'post'
  

  
end
