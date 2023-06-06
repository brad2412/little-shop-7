class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end
  
  def new
    
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.create(merchant_params)
    redirect_to "/admin/merchants"
  end

  def update
    merchant = Merchant.find(params[:id])
    if merchant.update(merchant_params)
      redirect_to "/admin/merchants/#{merchant.id}"
      flash[:alert] = "Sucessfully edited merchant"
    end
  end
  
  private
  def merchant_params
    params.permit(:name, :status)
  end
end