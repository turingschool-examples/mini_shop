Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to:'merchants#show'
  get '/merchants/:id/edit', to:'merchants#edit'

  get '/items', to:'items#index'
  get '/items/:id', to: 'items#show'
  get '/merchants/:merchant_id/items', to:'merchant_items#index'
  get '/merchants/:merchant_id/items/new', to:'merchant_items#new'
  post '/merchants/:merchant_id/items', to:'merchant_items#create'

  post '/merchants', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
end
