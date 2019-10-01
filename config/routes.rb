Rails.application.routes.draw do
  resources :merchants
  resources :items, only: [:index]
end
