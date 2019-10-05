class ItemsController < ApplicationController

  def index
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      binding.pry
    else
      @items = Item.all
    end
  end

end
