Rails.application.routes.draw do
  #Routes only for singin/signout
  devise_for :users, only: :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#home", as: 'home'
  get 'bio', to: 'posts#bio', as: 'bio'
  get 'admin', to: 'posts#admin', as: 'admin'

  #Nesting of routes for creating comments
  concern :commentable do
    resources :comments, only: [:new, :create]
  end
  #Routes for posts
  resources :projects, param: :title, concerns: :commentable, only: [ :show, :index, :new, :create ]
  resources :stories, param: :title, concerns: :commentable, only: [ :show, :index, :new, :create ]

end
