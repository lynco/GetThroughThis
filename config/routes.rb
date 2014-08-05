GetThroughThis::Application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  resources :navbar_entries
  resources :web_services

  devise_for :users
  resources :users, path: 'profiles'
  resources :search
  resources :tags, only: [:show]
  resources :list_entries

  root to: 'welcome#index'
  get "about" => "welcome#about"

  get "/search" => "search#results"
  get "/map" => "maps#draw"

  namespace :cms do
    get "/pages/(:id)/(:template)/(:layout)" => "pages#show"
  end

  # Need a catch all to redirect to the errors controller, for catching 404s as an exception
  match "*path", to: "errors#catch_404", via: [:get, :post]
end
