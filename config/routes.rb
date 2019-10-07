Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'merchants#index'
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:merchant_id', to: 'merchants#show'
  get '/merchants/:merchant_id/edit', to: 'merchants#edit'
  get 'merchants/:merchant_id/items', to: 'merchants#items'
  get '/merchants/:merchant_id/items/new', to: 'items#new'

  get '/items', to: 'items#index'
  get '/items/:item_id', to: 'items#show'
  get '/items/:item_id/edit', to: 'items#edit'

  post '/merchants', to: 'merchants#create'
  post '/merchants/:merchant_id/items', to: 'items#create'

  patch '/merchants/:merchant_id', to: 'merchants#update'
  patch '/items/:item_id', to: 'items#update'

  delete '/merchants/:merchant_id', to: 'merchants#destroy'
  delete '/items/:item_id', to: 'items#destroy'
end
