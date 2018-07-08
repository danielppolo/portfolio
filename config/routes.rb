Rails.application.routes.draw do
  #Routes only for singin/signout
  devise_for :users, only: :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#home", as: 'home'
  get 'bio', to: 'posts#bio', as: 'bio'
  get 'admin', to: 'posts#admin', as: 'admin'

  scope '/admin' do
    get 'projects', to: 'posts#project_manager', as: 'projects_manager'
    get 'stories', to: 'posts#story_manager', as: 'stories_manager'
  end

  #Nesting of routes for creating comments
  concern :commentable do
    resources :comments, only: [:new, :create]
  end
  #Routes for posts
  resources :projects, param: :title, concerns: :commentable
  resources :stories, param: :title, concerns: :commentable

end
