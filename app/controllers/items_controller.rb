class ItemsController < ApplicationController
  def index
    @items = Item.all
    @merchant_id = params[:merchant_id]
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.items.create!(item_params)
    redirect_to merchant_items_path(merchant)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    Item.find(params[:id]).update(item_params)
    redirect_to item_path(params[:id])
  end

  private

  def item_params
    params.permit(
      :name,
      :price,
      :description,
      :image,
      :inventory,
      :merchant_id
    )
  end
end
