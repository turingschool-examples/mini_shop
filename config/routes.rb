Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:id/items', to: 'merchants#items_index'
  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
  get '/merchants/:id/items/new', to: 'merchants#item_new'
  post '/merchants', to: 'merchants#create'
  post '/merchants/:id/items', to: 'items#create'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#delete'
end
