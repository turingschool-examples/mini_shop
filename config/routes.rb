Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #------------ Merchant Routes ------------#
  get '/', to: 'merchants#index'
  get '/merchants', to: 'merchants#index'

  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'

  get '/merchants/:id', to: 'merchants#show'

  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'

  delete '/merchants/:id', to: 'merchants#destroy'


  #------------ Merchant Items Routes ------------#
  get '/merchants/:id/items', to: 'merchants#items_index'

  get '/merchants/:id/items/new', to: 'merchants#new_item'


  #------------ Item Routes ------------#
  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'

end
