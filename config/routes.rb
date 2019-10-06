Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'
  post '/merchants/:id/items', to: 'items#create'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants/:id/items/new', to: 'items#new'
  get '/merchants/:id/items', to: 'merchants#merchant_item'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:id', to: 'merchants#show'

  get '/items', to: 'items#index'
  get '/items/:id/edit', to: 'items#edit'
  get '/items/:id', to: 'items#show'
  post '/items/:id', to: 'items#edit'
  patch '/items/:id', to: 'items#update'
  delete '/items/:id', to: 'items#destroy'
end
