Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to:'merchants#show'
  get '/merchants/:merchant_id/edit', to:'merchants#edit'

  post '/merchants', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#update'
end
