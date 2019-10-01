Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/merchants', to: 'merchants#index'
end
