class ItemsController < ApplicationController

  def index
    if params[:active] == "true"
      items = Item.all
      @items = items.select {|item| item.active == true}
    elsif params[:active] == "false"
      items = Item.all
      @items = items.select {|item| item.active == false}
    else @items = Item.all
    end
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
    item.restock
    redirect_to "/items/#{item.id}"
  end

  def buy_item
    item = Item.find(params[:id])
    item.buy
    redirect_to "/items/#{item.id}"
  end

  def delete
    Item.destroy(params[:id])
    redirect_to '/items'
  end


  private

  def item_params
    params.permit(:name, :description, :price, :image, :active, :inventory)
  end

end
