Rails.application.routes.draw do
  devise_for :users
  resources :group_entities
  resources :groups
  resources :entities
  resources :users
  resources :splash

  root "splash#show"
end
