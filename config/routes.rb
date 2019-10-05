Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/update', to: 'merchants#update'
  get '/merchants/:id/items', to: 'merchants#items'
  post '/merchants', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#change_info'
  delete '/merchants/:id', to: 'merchants#destroy'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
  get '/merchants/:id/items/new', to: 'items#new'
  post '/merchants/:id/items', to: 'items#create'
end
