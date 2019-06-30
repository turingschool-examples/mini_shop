class ItemsController < ApplicationController

  def index
      if params[:merchant_id].nil?
        @items = Item.all
      else
        @merchant = Merchant.find(params[:merchant_id])
        @items = @merchant.items
      end
    end



  # private
  #
  # def item_params
  #   params.require(:item).permit(:name, :price, :image, :status, :inventory)
  # end

end
