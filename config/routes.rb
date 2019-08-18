Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/merchants', to: 'merchants#index' #request to fetch  merchant index page
  get "/merchants/new", to: "merchants#new" #request to fetch merchant new page
  get '/merchants/:id', to: 'merchants#show' #request to fetch metchant show page
  post "/merchants", to: "merchants#create" #request to post or create a new merchant
  get "/merchants/:id/edit", to: "merchants#edit"#{request to fetch and display merchant edit page}
  patch "/merchants/:id", to: "merchants#update" #request to change a part of a resource
  delete "/merchants/:id", to: "merchants#destroy"

  get "/items", to: "items#index"
end
