Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/merchants', to: 'merchants#index'

  post '/merchants', to: 'merchants#create'
  get '/merchants/new', to: 'merchants#new'

  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: "merchants#update"

  delete '/merchants/:id', to: 'merchants#delete'

  get '/merchants/:id', to: 'merchants#show'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'

  get "/merchants/:merchant_id/items", to: 'items#show'

end
