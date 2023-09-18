Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  root to: "orders#index"
  resources :items
  resources :orders, only:[:create]
end