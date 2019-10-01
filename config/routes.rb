Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/', to: 'welcome#index'
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new', as: 'new_merchant'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id', to: 'merchants#show', as: 'merchant'
end
