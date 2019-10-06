Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:merchant_id', to:'merchants#show'
  get '/merchants/:merchant_id/edit', to:'merchants#edit'
  get '/items', to:'items#index'

  post '/merchants', to: 'merchants#create'
  patch '/merchants/:merchant_id', to: 'merchants#update'
  delete '/merchants/:merchant_id', to: 'merchants#destroy'
end
