class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.create!(item_params)
    item.active = true
    redirect_to "/merchants/#{merchant.id}/items"
  end

  private

def item_params
  params.permit(:name, :description, :price, :image, :inventory, :active)
end


end
