Rails.application.routes.draw do
  get 'session/new'
  post 'session/signin'
  delete 'session/logout'
  get 'session/forgot_password'
  put 'session/reset_password'

  resources :users, only: [:new, :create]

  root 'main#index'
end
