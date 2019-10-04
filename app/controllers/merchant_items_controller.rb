class MerchantItemsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = Item.where(merchant_id: params[:merchant_id])
  end

end
