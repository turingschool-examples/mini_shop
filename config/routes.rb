Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to:'merchants#show'
  get '/merchants/:id/edit', to:'merchants#edit'

  post '/merchants', to: 'merchants#create'
end
