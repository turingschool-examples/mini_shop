class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.find(params[:id])
    merchant.items.create!({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image],
      inventory: params[:inventory],
      status: "active",
      merchant_name: merchant.name
    })

    redirect_to "/merchants/#{merchant.id}/items"
  end
end
