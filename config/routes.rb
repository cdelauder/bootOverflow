BootOverflow::Application.routes.draw do
  root 'users#index'
  resources :users, :only => [:index]
  resources :sessions, :only => [:new, :create]
  resources :questions, :only => [:index, :show, :new, :create, :destroy]
end
