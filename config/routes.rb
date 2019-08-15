Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/edit', to: 'merchants#edit'
end
