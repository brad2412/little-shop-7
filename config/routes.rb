Rails.application.routes.draw do
  
  get "/admin", to: "admin/dashboards#index" 
  get "/admin/merchants", to: "admin/merchants#index"
  get "/admin/invoices", to: "admin/invoices#index"
  get "admin/merchants/new", to: "admin/merchants#new"
  post "admin/merchants", to: "admin/merchants#create"
  get "/admin/merchants/:id/edit", to: "admin/merchants#edit"
  patch "/admin/merchants/:id", to: "admin/merchants#update"
  get "/admin/merchants/:id", to: "admin/merchants#show"
  get "/admin/invoices/:id", to: "admin/invoices#show"

  get "/merchants/:id/dashboard", to: "merchants#show"

  # get "/merchants/:id/items", to: "merchants/items#index"
  # get "merchants/:id/items/:id", to: "merchants/items#show"
  
  resources :merchants, only: [:show] do
    resources :items, only: [:index, :show], controller: "merchants/items"
  end

  get "/merchants/:id/invoices", to: "merchants/invoices#index"
  get "merchants/:id/invoices/:id", to: "merchants/invoices#show"

end
