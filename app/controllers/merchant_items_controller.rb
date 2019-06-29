class MerchantItemsController < ApplicationController

  def index
    @items = Merchant.find(params[:id]).items
    @merchant = Merchant.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:id])
    @merchant.items.create!(item_params)

    redirect_to "/merchants/#{@merchant.id}/items"
  end

  private
  def item_params
    params.permit(:name, :price, :description, :image, :inventory)
  end


end
