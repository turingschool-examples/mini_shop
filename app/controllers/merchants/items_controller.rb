class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

 private

 def item_params
   params.permit(:name, :description, :price, :inventory, :status, :image)
 end
end
