Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'merchants#index'
  get '/merchants', to: 'merchants#index'
  get '/items', to: 'items#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  patch '/merchants/:id', to: 'merchants#update', as: :update_merchant
  get '/merchants/:id/items', to: 'merchants#items'
  post '/merchants/:id/items', to: 'items#create', as: :merchant_items
  get '/merchants/:id/items/new', to: 'items#new'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/items/:id/edit', to: 'items#edit'
  patch '/items/:id', to: 'items#update', as: :update_item
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id/delete', to: 'merchants#delete'
  get '/items/:id/delete', to: 'items#delete'
  get '/items/:id', to: 'items#show'
end
