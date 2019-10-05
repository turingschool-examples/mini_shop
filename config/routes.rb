Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'

  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'

  get '/merchants/:id/items', to: 'merchants/items#index'
  get '/merchants/:id/items/new', to: 'merchants/items#new'
  post '/merchants/:id/items', to: 'merchants/items#create'

end
