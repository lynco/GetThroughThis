GetThroughThis::Application.routes.draw do
  resources :navbar_entries
  devise_for :users
  resources :users, path: 'profiles'

  root to: 'welcome#index'
  get "/search" => "search#results"

end
