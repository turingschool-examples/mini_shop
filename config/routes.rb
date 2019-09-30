Rails.application.routes.draw do
  resources :merchants do
    resources :items, only: %i[index new create]
  end
  resources :items, only: %i[index show edit update]
end
