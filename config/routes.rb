Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/merchants', to: 'merchants#index', as: :merchants
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  get '/merchants/new', to: 'merchants#new', as: :new_merchant


end
