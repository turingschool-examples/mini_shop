class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def new
   @merchant_id = params[:merchant_id]
 end

 def create
   merchant = Merchant.find(params[:merchant_id])
   item = merchant.items.new(item_params)
   # item.save
   # if item.save
   #   redirect_to "/merchants/#{item.merchant_id}/items"
   # else
   #   render :new
   # end
 end


 private

 def item_params
   params.permit(:name, :description, :price, :inventory, :status, :image)
 end
end
