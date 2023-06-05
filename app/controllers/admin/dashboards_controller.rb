class Admin::DashboardsController < ApplicationController
  def dashboard
    @customers = Customer.all
    @invoices = Invoice.all
  end
end