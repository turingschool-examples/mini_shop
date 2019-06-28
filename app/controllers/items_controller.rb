class ItemsController < ApplicationController
  def index
    if params[:merchant_id] == nil
      @items = Item.all
    else
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    item = Item.create!(item_params)
    item.save!
    redirect_to "/items/#{item.id}"
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :active, :inventory, :merchant_id, :merchant_name)
  end

end
