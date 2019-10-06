Rails.application.routes.draw do
  # get '/', to: 'welcome#index'
  resources :merchants do
    resources :items
  end
  get    '/merchants',          to: 'merchants#index'
  get    '/merchants/new',      to: 'merchants#new'
  get    '/merchants/:id',      to: 'merchants#show'
  get    '/merchants/:id/edit', to: 'merchants#edit'
  post   '/merchants',          to: 'merchants#create'
  patch  '/merchants/:id',      to: 'merchants#update'
  delete '/merchants/:id',      to: 'merchants#destroy'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
  # get '/merchants/:merchant_id/items', to: 'items#index'


  get '/welcome', to: 'welcome#index'
end
