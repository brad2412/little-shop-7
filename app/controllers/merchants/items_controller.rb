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
    # require 'pry'; binding.pry
    
    if 
      params[:commit] == "Disable"  || params[:commit] == "Enable" 
      redirect_to merchant_items_path(@merchant) 
    elsif
       @item.update(item_params)
      flash[:alert] = "#{@item.name} successfully updated"
      redirect_to merchant_item_path(@merchant, @item)
    else
      flash[:alert] = "All fields must be filled in"
      render :edit
    end
  end

  private
  def item_params
    params.permit(:name, :unit_price, :description, :id)
  end
end