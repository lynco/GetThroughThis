GetThroughThis::Application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  resources :navbar_entries
  resources :web_services

  devise_for :users
  resources :users, path: 'profiles'
  resources :search

  root to: 'welcome#index'

  get "/search" => "search#results"

  # Need a catch all to redirect to the errors controller, for catching 404s as an exception
  match "*path", to: "errors#catch_404", via: [:get, :post]
end
