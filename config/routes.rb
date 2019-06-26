Rails.application.routes.draw do
  get '/', to: 'merchants#index'
  get '/merchants', to: 'merchants#index', as: :merchants
  get '/merchants/new', to: 'merchants#new', as: :new_merchant
  post '/merchants/new', to: 'merchants#create'
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  get '/merchants/:id/edit', to: 'merchants#edit', as: :edit_merchant
  patch '/merchants/:id', to: 'merchants#update', as: :update_merchant
  delete '/merchants/:id/delete', to: 'merchants#destroy', as: :delete_merchant
  get '/merchants/:id/items', to: 'merchants#items', as: :merchant_items

  get '/items', to: 'items#index', as: :items
end
