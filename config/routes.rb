Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/merchants', to: 'merchants#index'
  # get '/merchants/new', to: 'merchants#new'
  # post '/merchants', to: 'merchants#create'
  # get '/merchants/:id', to: 'merchants#show'
  # get '/merchants/:id/edit', to: 'merchants#edit'
  # patch '/merchants/:id', to: 'merchants#update'
  # delete '/merchants/:id', to: 'merchants#destroy'
  resources :items, only: [:index, :show]
  resources :merchants do
    resources :items, only: [:new, :create]
  end

  get '/merchants/:merchant_id/items', to: 'merchants#items'
  # get '/merchants/:merchant_id/items/new', to: 'items#new'
  # post '/merchants/:merchant_id/items', to: 'items#create'

  # get '/items', to: 'items#index'
  # get '/items/:id', to: 'items#show'
end
