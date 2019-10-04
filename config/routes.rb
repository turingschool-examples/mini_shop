Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/update', to: 'merchants#update'
  post '/merchants', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#change_info'
  delete '/merchants/:id', to: 'merchants#destroy'
end
