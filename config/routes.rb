Todo::Application.routes.draw do

  get 'static/index'
  get 'static/about'
  get 'static/register'
  get 'static/login'

  get 'users/index'
  get 'users/new'
  get 'users/edit'
  get 'users/show'

  get 'register', to: 'static#register'
  get 'login', to: 'static#login'
  get 'activate', to: 'users#activate'

  resources :users

  root :to => 'static#index'

end
