Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/merchants', to: 'merchants#index', as: :merchants
  get '/merchants/new', to: 'merchants#new', as: :new_merchant
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  get '/merchants/:id/edit', to: 'merchants#edit', as: :edit_merchant
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy', as: :delete_merchant

  get '/merchants/:merchant_id/items', to: 'merchants#item_index', as: :merchant_items
  get '/merchants/:merchant_id/items/new', to: 'items#new', as: :new_item
  post 'merchants/:merchant_id/items', to: 'items#create'

  get '/items', to: 'items#index', as: :items
  get '/items/:id', to: 'items#show', as: :item
end
