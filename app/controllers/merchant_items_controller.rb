class MerchantItemsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:id])
    @items = Item.where(merchant_id: params[:id])
  end

end
