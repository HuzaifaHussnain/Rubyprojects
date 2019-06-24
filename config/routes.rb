Rails.application.routes.draw do
  resources :users, only: [:new, :index, :create ]

  post 'users/login', action: :login, controller: :users
  get 'users/login', action: :login, controller: :users
  get 'users/signout', action: :signout, controller: :users
  delete 'users/delete_user', action: :delete_user,controller: :users
end
