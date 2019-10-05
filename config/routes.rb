Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:id/items', to: 'merchants#items'
  get '/merchants/:merchant_id/items/new', to: 'merchants#item_new'
  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
  post '/merchants/:id/items', to: 'merchants#item_create'
  post '/merchants', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
end
