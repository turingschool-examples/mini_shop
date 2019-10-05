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
    @merchant = Merchant.find(params[:id])
    redirect_to "/merchants/#{@merchant.id}/items"

    Item.create(name: item_params[:name],
                description: item_params[:description],
                price: item_params[:price],
                inventory: item_params[:inventory],
                image: item_params[:image],
                active: true,
                merchant_id: @merchant.id,
              )
  end

  private
  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end

end
