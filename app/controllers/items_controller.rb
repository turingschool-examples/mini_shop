class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.new(item_params)
    @item.save
    redirect_to merchant_items_path(@item.merchant)
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :status, :inventory)
  end

end
