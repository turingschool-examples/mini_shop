Rails.application.routes.draw do
  resources :merchants, except: %i[destroy]
end
