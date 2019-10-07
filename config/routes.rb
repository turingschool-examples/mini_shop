Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #------------ Merchant Routes ------------#
  get '/', to: 'items#index'
  get '/merchants', to: 'merchants#index'

  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'

  get '/merchants/:id', to: 'merchants#show'

  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'

  delete '/merchants/:id', to: 'merchants#destroy'


  #------------ Merchant Items Routes ------------#
  get '/merchants/:merchant_id/items', to: 'merchants#items_index'

  get '/merchants/:merchant_id/items/new', to: 'items#new'
  post '/merchants/:merchant_id/items', to: 'items#create'


  #------------ Item Routes ------------#
  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'

  get '/items/:id/edit', to: 'items#edit'
  patch '/items/:id', to: 'items#update'

  delete '/items/:id', to: 'items#destroy'

  patch '/items/:id/deactivate', to: 'items#deactivate'
  patch '/items/:id/activate', to: 'items#activate'

end
