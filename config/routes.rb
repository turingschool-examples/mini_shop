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

  resources :merchants, only: [:show] do
    get '/items', to: 'merchants/items#index'
  end
end
