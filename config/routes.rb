Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'
end
