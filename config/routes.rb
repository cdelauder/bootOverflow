BootOverflow::Application.routes.draw do
  root 'users#index'
  resources :users, :only => [:index]
  resources :sessions, :only => [:new, :create]
end
