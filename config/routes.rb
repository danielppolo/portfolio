Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'bio', to: 'posts#index', as: 'bio'

  concern :commentable do
    resources :comments, only: [:new, :create]
  end

  resources :projects, param: :title, concerns: :commentable, only: [ :show, :index ]
  resources :stories, param: :title, concerns: :commentable, only: [ :show, :index ]

end
