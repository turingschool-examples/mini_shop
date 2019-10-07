Rails.application.routes.draw do
  # resources :merchants do
  #   resources :items
  # end
  get    '/merchants',          to: 'merchants#index'
  get    '/merchants/new',      to: 'merchants#new'
  get    '/merchants/:id',      to: 'merchants#show'
  get    '/merchants/:id/edit', to: 'merchants#edit'
  post   '/merchants',          to: 'merchants#create'
  patch  '/merchants/:id',      to: 'merchants#update'
  delete '/merchants/:id',      to: 'merchants#destroy'

  get    '/items',          to: 'items#index'
  get    '/items/:id',      to: 'items#show'
  get    '/items/:id/edit', to: 'items#edit'
  patch  '/items/:id',      to: 'items#update'
  delete '/items/:id',      to: 'items#destroy'

  get  "/merchants/:merchant_id/items",     to: "items#index"
  post "/merchants/:merchant_id/items",     to: "items#create"
  get  "/merchants/:merchant_id/items/new", to: "items#new"
end
