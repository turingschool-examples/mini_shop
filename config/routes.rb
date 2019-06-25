Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index', as: :merchants
  get '/merchants/:id', to: 'merchants#show', as: :merchant
end
