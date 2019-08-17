class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show_by_merchant
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def show
    @item = Item.find(params[:id])
  end
end
