class ItemsController < ApplicationController

  def index
      if params[:merchant_id].nil?
        @items = Item.all
      else
        @merchant = Merchant.find(params[:merchant_id])
        @items = @merchant.items
      end
    end

  def show
    @item = Item.find(params[:id])
  end

  def create
    merchant = Merchant.find_by(params[:merchant_id])
    item = merchant.items.create!(item_params)
    status = "active"
    redirect_to "/merchants/#{merchant.id}/items"

  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :image, :status, :inventory, :merchant)
  end
end
