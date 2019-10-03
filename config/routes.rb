Rails.application.routes.draw do
  # get '/', to: 'welcome#index'
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'

  post '/merchants', to: 'merchants#create'

  delete '/merchants/:id', to: 'merchants#destroy'
end
