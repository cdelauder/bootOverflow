BootOverflow::Application.routes.draw do
  resources :user, :only => [:index]
  resources :session, :only => [:new, :create]
end
