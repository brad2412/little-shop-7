class Merchants::InvoicesController < ApplicationController
  def index
    # merchant = Merchant.find(params[:id])
    # require 'pry'; binding.pry
  end

  def show
    @invoice = Invoice.find(params[:id])
  end
end