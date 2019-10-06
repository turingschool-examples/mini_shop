Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'

  get '/merchants/:merchant_id', to: 'merchants#show'
  get '/merchants/:merchant_id/edit', to: 'merchants#edit'
  patch '/merchants/:merchant_id', to: 'merchants#update'
  delete '/merchants/:merchant_id', to: 'merchants#destroy'

  get '/items', to: 'items#index'

  get '/items/:item_id', to: 'items#show'
  get '/items/:item_id/edit', to: 'items#edit'
  patch '/items/:item_id', to: 'items#update'
  delete '/items/:item_id', to: 'items#destroy'

  get '/merchants/:merchant_id/items', to: 'merchants/items#index'
  get '/merchants/:merchant_id/items/new', to: 'merchants/items#new'
  post '/merchants/:merchant_id/items', to: 'merchants/items#create'

end
