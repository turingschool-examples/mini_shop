class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show_by_merchant
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @item = @merchant.items.create!(item_params)
    @item.status = true;
    redirect_to "/merchants/#{@merchant.id}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

private
  def item_params
    params.permit(:name, :price, :description, :image, :inventory)
  end
end
