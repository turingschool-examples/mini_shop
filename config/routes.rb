Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/merchants', to: 'merchants#index'
  get '/items', to: 'items#index'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id/items/new', to: 'merchants#new_item'
  post '/merchants/:id/items', to: 'merchants#create_new_item'
  get '/merchants/:id/items', to: 'merchants#item_index'
  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'
  get '/items/:id', to: 'items#show'
  get '/merchants/:id', to: 'merchants#show'

end
