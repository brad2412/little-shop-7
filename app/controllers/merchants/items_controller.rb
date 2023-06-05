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
    @item.update(name: params[:name], unit_price: params[:unit_price], description: params[:description])
    redirect_to merchant_item_path(@merchant, @item)
  end
end