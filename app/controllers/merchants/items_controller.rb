class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = Item.where(merchant: @merchant)
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @merchant.items.create!(item_params)

    redirect_to("/merchants/#{@merchant.id}/items")
  end

  private
    def item_params
      defaults = {status: "Active"}
      params.permit(:name, :description, :image, :price, :inventory, :status).reverse_merge(defaults)
    end
end