class MerchantItemsController < ApplicationController

  def index
    @items = Merchant.find(params[:id]).items
  end

end
