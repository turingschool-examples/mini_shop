class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.create!(item_params)
    item.update({active_status: true})
    redirect_to "/merchants/#{merchant.id}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    item.save
    redirect_to item_path(item)
  end

  private
  def item_params
    params.permit(:name, :description, :price, :image, :active_status, :inventory)
  end
end
