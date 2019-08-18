class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def new
   @merchant_id = params[:merchant_id]
 end

 def create
   @merchant = Merchant.find(params[:merchant_id])
   @item = @merchant.items.create!(item_params)
   @item.status = true;
   redirect_to "/merchants/#{@merchant.id}/items"
 end

 private

 def item_params
   params.permit(:name, :description, :price, :inventory, :status, :image)
 end
end
