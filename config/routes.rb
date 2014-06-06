BootOverflow::Application.routes.draw do
  root "sessions#new"
  get "sessions/create"

end
