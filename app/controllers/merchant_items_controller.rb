class MerchantItemsController < ApplicationController

  def index
    @items = Item.where(merchant_id: params[:id])
  end

end
