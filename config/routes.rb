Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "merchants#index"

  post '/merchants/:merchant_id/items', to: "items#create"

  get '/merchants', to: "merchants#index"
  get '/merchants/new', to: "merchants#new"
  post '/merchants', to: "merchants#create"

  patch '/merchants/:id', to: "merchants#update"
  get '/merchants/:id/edit', to: "merchants#edit"
  get '/merchants/:id', to: "merchants#show"
  get '/merchants/:merchant_id/items', to: "items#index"

  get '/merchants/:merchant_id/items/new', to: "items#new"

  delete '/merchants/:id', to: "merchants#destroy"

  patch '/items/:id', to: "items#update"
  patch '/items/:id/activate', to: "items#activate"
  patch '/items/:id/deactivate', to: "items#deactivate"
  get '/items/:id/edit', to: "items#edit"
  get '/items', to: "items#index"
  get '/items/:id', to: "items#show"



end
