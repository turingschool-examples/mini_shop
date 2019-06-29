class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update({
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image],
      inventory: params[:inventory]
      })
    item.save

    redirect_to "/items/#{item.id}"
  end

end
