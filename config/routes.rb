Rails.application.routes.draw do
  
  get "/admin", to: "admin/dashboards#dashboard" 
  get "/admin/merchants", to: "admin/merchants#index"
  get "/admin/invoices", to: "admin/invoices#index"

  get "/merchants/:id/dashboard", to: "merchants#show"
  get "/merchants/:id/items", to: "merchants/items#index"
  get "/merchants/:id/invoices", to: "merchants/invoices#index"

end
