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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.save
    redirect_to item_path(@item)
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :status, :inventory)
  end

end
