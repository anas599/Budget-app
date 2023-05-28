Rails.application.routes.draw do
  devise_for :users
  resources :group_entities
  resources :groups
  resources :entities
  resources :users
  # Defines the root path route ("/")
  root "users#splash"
end
