class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update({
      name: params[:item][:name],
      description: params[:item][:description],
      price: params[:item][:price],
      image: params[:item][:image],
      active_status: true,
      inventory: params[:item][:inventory],
      merchant_id: item.merchant_id
    })

    item.save
    redirect_to "/items/#{item.id}"
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to '/items'
  end

end
