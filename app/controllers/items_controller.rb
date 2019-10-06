class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def edit
    @item = Item.find(params[:item_id])
  end

  def update
    item = Item.find(params[:item_id])
    item.update(item_params)
    redirect_to("/items/#{item.id}")
  end

  private
    def item_params
      params.permit(:name, :description, :image, :inventory, :price, :status)
    end

end