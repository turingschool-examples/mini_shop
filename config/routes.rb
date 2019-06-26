Rails.application.routes.draw do
  get '/', to: 'merchants#index'
  get '/merchants', to: 'merchants#index', as: :merchants
  get '/merchants/new', to: 'merchants#new', as: :new_merchant
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  get '/merchants/:id/edit', to: 'merchants#edit', as: :edit_merchant
  post '/merchants/new', to: 'merchants#create'
  patch '/merchants/:id', to: 'merchants#update', as: :update_merchant
end
