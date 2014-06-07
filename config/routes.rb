BootOverflow::Application.routes.draw do
  get 'sign_up'=> 'users#new', :as => 'sign_up'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  root :to => 'users#index'

  concern :commentable do
    resources :comments, only: [:index, :new, :create]
  end

  resources :users, :only => [:index, :new, :create]

  resources :questions do
    concerns :commentable
    resources :answers, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :answers do
    concerns :commentable
  end

  resources :sessions, :only => [:new, :create, :destroy]
end
