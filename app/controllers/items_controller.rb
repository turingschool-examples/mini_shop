class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new({
      name: params[:item][:name],
      description: params[:item][:description],
      price: params[:item][:price],
      image: params[:item][:image],
      active_status: true,
      inventory: params[:item][:inventory],
      merchant_id: params[:id]
    })

    item.save
    redirect_to "/merchants/#{params[:id]}/items"
  end

end
