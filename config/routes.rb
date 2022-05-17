Rails.application.routes.draw do
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :resumes
  root "resumes#index"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :tag
  get '/archive',action: :index,controller: 'archive'
  get '/about',action: :index ,controller:'about'
  resources :articles
  resources :post
  get '/post/new',action: :new,controller:'post'
end
