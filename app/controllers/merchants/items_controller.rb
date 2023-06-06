class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @item= Item.find(params[:id])
  end
  
  def edit 
    show
  end
  
  def update
    show
    if @item.update(item_params)
      flash[:alert] = "#{@item.name} successfully updated"
      redirect_to merchant_item_path(@merchant, @item)
    end
  end

  private
  def item_params
    params.permit(:name, :unit_price, :description, :id)
  end
end