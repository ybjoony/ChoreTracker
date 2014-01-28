ChoreTracker::Application.routes.draw do

  # Generated routes for models
  resources :chores
  resources :tasks
  resources :children
  
  # Routes for authentication
  resources :users
  resources :sessions
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  
  # Setting default route
  root :to => 'chores#index'
  
end
