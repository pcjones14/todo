Todo::Application.routes.draw do

  get "static/index"
  get "static/about"
  get "static/register"
  get "static/login"

  get "users/index"
  get "users/new"
  get "users/edit"
  get "users/show"

  resources :users

  root :to => 'static#index'

end
