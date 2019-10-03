class ItemsController < ApplicationController

  def index
    if params.has_key?(:id)
      @items = Item.where(merchant_id: params[:id])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    item = Item.new({
    name: params[:item][:name],
    description: params[:item][:description],
    price: params[:item][:price],
    image: params[:item][:image],
    status: "active",
    inventory: params[:item][:inventory],
    name: params[:item][:name],
    merchant_id: params[:id]
    })
    item.save
    redirect_to "/merchants/#{params[:id]}/items"
  end

end
