Rails.application.routes.draw do
  get '/', to: 'merchants#index'
  get '/merchants', to: 'merchants#index', as: :merchants
  get '/merchants/new', to: 'merchants#new', as: :new_merchant
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  post '/merchants', to: 'merchants#create'
end
