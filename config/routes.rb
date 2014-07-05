GetThroughThis::Application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  resources :navbar_entries
  resources :web_services

  devise_for :users
  resources :users, path: 'profiles'
  resources :search

  root to: 'welcome#index'
end
