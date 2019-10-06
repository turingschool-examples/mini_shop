Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:merchant_id/items', to: 'merchants#items_index'

  post '/merchants', to: 'merchants#create'

  patch '/merchants/:id', to: 'merchants#update'

  delete '/merchants/:id', to: 'merchants#destroy'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
end
