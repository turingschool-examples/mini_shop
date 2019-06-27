Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/merchants', to: "merchants#index"
get '/merchants/new', to: "merchants#new"
post '/merchants', to: "merchants#create"
patch '/merchants/:id', to: "merchants#update"
get '/merchants/:id/edit', to: "merchants#edit"
get '/merchants/:id', to: "merchants#show"
get '/merchants/:merchant_id/items', to: "items#index"
delete '/merchants/:id', to: "merchants#destroy"

get '/items', to: "items#index"
get '/items/:id', to: "items#show"



end
