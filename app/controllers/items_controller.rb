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
    merchant = Merchant.find(params[:id])
    @item = merchant.items.create(item_params)
    redirect_to "/merchants/#{@item.merchant_id}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to "/items/#{item.id}"
  end

  def delete
    Item.destroy(params[:id])
    redirect_to '/items'
  end


  private

  def item_params
    params.permit(:name, :description, :price, :image, :active?, :inventory)
  end

end
