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
    item.update({name: params[:name],
                 description: params[:description],
                 price: params[:price],
                 image: params[:image_url],
                 inventory: params[:inventory]})
    item.save
    redirect_to "/items/#{item.id}"
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to '/items'
  end
end
