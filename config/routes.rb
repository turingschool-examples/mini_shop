Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index', as: :merchants
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  get '/new', to: 'merchants#new', as: :new_merchant
end
