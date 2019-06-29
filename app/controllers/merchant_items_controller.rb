class MerchantItemsController < ApplicationController

  def index
    @items = Merchant.find(params[:id]).items
    @merchant = Merchant.find(params[:id])
  end
  
end
