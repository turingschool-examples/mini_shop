Rails.application.routes.draw do
  resources :merchants do
    resources :items, only: %i[index new create]
  end
  resources :items, except: %i[new create]
end
