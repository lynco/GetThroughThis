GetThroughThis::Application.routes.draw do
  resources :navbar_entries
  devise_for :users
  resources :users, path: 'profiles'
  resources :search

  root to: 'welcome#index'
end
