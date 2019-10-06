class ItemsController < ApplicationController

  def index
    if params[:merchant_id]
      @items = Item.where(merchant_id: params[:merchant_id])
      @merchant = Merchant.find(params[:merchant_id])
      render action: 'merchant_items'
    else
      @items = Item.all
      render action: 'index'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  def create
    Merchant.find(params[:merchant_id]).items.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image],
      active: true,
      inventory: params[:inventory],
      merchant_id: params[:merchant_id],
    )
    redirect_to "/merchants/#{params[:merchant_id]}/items"
  end
end

