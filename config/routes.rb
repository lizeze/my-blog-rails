Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  resources :tag
  get '/archive',action: :index,controller: 'archive'
  get '/about',action: :index ,controller:'about'
  resources :articles
  resources :post
end
