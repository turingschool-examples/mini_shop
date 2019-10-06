Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  get '/items', to: 'items#index'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:id/items', to: 'merchants#items_index'
  get '/items/:id', to: 'items#show'
  get '/merchants/:id/items/new', to: 'items#new'
  get '/items/:id/edit', to: 'items#edit'
  post '/merchants/:id/items', to: 'items#create'
  post '/merchants', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#update'
  patch '/items/:id', to: 'items#update'
  delete '/merchants/:id', to: 'merchants#destroy'
  delete '/items/:id', to: 'items#destroy'
end
