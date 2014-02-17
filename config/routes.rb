AuthFromScratch::Application.routes.draw do
  root 'users#new'
  get 'log_in', to: 'sessions#new'
  get 'log_out', to: 'sessions#destroy'
  get 'sign_up', to: 'users#new'
  resource :sessions
  resource :users
end
