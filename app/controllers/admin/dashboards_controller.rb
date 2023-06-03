class Admin::DashboardsController < ApplicationController
  def dashboard
    @customers = Customer.all
  end
end