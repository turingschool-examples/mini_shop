Rails.application.routes.draw do
  get '/', to: 'merchants#index'
  get '/merchants', to: 'merchants#index', as: :merchants
  get '/merchants/new', to: 'merchants#new', as: :new_merchant
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id/edit', to: 'merchants#edit', as: :edit_merchant
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  patch '/merchants/:id', to: 'merchants#update', as: :update_merchant
  delete '/merchants/:id', to: 'merchants#destroy', as: :delete_merchant

  get '/items', to: 'items#index', as: :items
  get '/items/:id', to: 'items#show', as: :item
  get '/items/:id/edit', to: 'items#edit', as: :edit_item
  patch '/items/:id', to: 'items#update', as: :update_item
  patch '/items/:id/activate', to: 'items#update', as: :activate_item
  patch '/items/:id/deactivate', to: 'items#update', as: :deactivate_item
  delete '/items/:id', to: 'items#destroy', as: :delete_item

  get '/merchants/:merchant_id/items', to: 'items#index', as: :merchant_items
  get '/merchants/:merchant_id/items', to: 'items#index', as: :active_merchant_items
  get '/merchants/:merchant_id/items', to: 'items#index', as: :inactive_merchant_items
  get '/merchants/:merchant_id/items/new', to: 'items#new', as: :new_item
  post '/merchants/:merchant_id/items', to: 'items#create', as: :new_merchant_item
end
