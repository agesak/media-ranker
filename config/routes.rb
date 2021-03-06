Rails.application.routes.draw do
  root to: 'homepages#index'

  resources :users, only: [:show, :index]
  get '/login', to: 'users#login_form', as: 'login'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout', as: 'logout'

  resources :works
  post 'works/:id/upvote', to: 'works#upvote', as: 'upvote_work'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
