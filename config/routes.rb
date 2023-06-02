Rails.application.routes.draw do
  
  get "/admin", to: "admin/dashboards#dashboard" 
  get "/admin/merchants", to: "admin/merchants#index"
  get "/admin/invoices", to: "admin/invoices#index"

  get "/merchants/:id/dashboard", to: "merchants#show"
end
