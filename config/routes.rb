Rails.application.routes.draw do
  root 'chatroom#index'
  post 'create_message', to: 'chatroom#create'
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  resources :session, only: [:new, :create, :destroy]
  get 'login', to: 'session#new', as: 'login'
  post 'login/new', to: 'session#create', as: 'login_new'
  delete 'logout', to: 'session#destroy'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
