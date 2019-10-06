Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants/:id/items', to: 'merchants#merchant_item'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:id', to: 'merchants#show'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
end
