Rails.application.routes.draw do
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  resources :session, only: [:new, :create, :destroy]
  get 'login', to: 'session#new', as: 'login'
  post 'login/new', to: 'session#create', as: 'login_new'
  delete 'logout', to: 'session#destroy'
end
