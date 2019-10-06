class ItemsController < ApplicationController

  def index
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

private
  def item_params
    #Use for form_tag views
    params.permit(:name, :description, :price, :image, :status, :inventory, :merchant_id)
  end
end
