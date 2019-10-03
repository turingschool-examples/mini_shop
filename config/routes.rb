Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/', to: 'welcome#index'
  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'
  get '/merchants/new', to: 'merchants#new', as: 'new_merchant'
  post '/merchants', to: 'merchants#create'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants', to: 'merchants#index'
  get '/merchants/:id', to: 'merchants#show', as: 'merchant'
  get '/items', to: 'items#index'
  get 'items/:id', to: 'items#show'
  get '/merchants/:id/items', to: 'items#index'
  get '/merchants/:id/items/new', to: 'items#new'
  post '/merchants/:id/items', to: 'items#create'
end
