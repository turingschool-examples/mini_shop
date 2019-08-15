class ItemsController < ApplicationController
  def index
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
      @show = true
    elsif params[:id]
      @items = [ Item.find(params[:id]) ]
    else
      @items = Item.all
      @show = true
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end
