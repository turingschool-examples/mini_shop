class ItemsController < ApplicationController
  def index
    if params[:merchant_id].nil?
      @items = Item.all
    else
      @merchant = Merchant.find(params[:merchant_id])

      @items = @merchant.items
    end
  end
end
