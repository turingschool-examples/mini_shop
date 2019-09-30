Rails.application.routes.draw do
  resources :merchants do
    resources :items, only: [:index]
  end
  resources :items, only: %i[index show]
end
