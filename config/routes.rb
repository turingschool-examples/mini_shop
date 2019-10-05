Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:merchant_id', to: 'merchants#show'
  get '/merchants/:merchant_id/edit', to: 'merchants#edit'
  get 'merchants/:merchant_id/items', to: 'merchants#items'

  get '/items', to: 'items#index'
  get '/items/:item_id', to: 'items#show'

  post '/merchants', to: 'merchants#create'
  patch '/merchants/:merchant_id', to: 'merchants#update'

  delete '/merchants/:merchant_id', to: 'merchants#destroy'
end
