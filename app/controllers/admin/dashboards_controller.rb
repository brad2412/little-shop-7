class Admin::DashboardsController < ApplicationController
  def show
    @customers = Customer.all
    @invoices = Invoice.all
  end
end