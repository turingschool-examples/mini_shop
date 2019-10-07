class MerchantItemsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    if params.has_key?(:status)
      @items = Item.where(merchant_id: params[:merchant_id],status: params[:status])
    else
      @items = Item.where(merchant_id: params[:merchant_id])
    end
  end


end
