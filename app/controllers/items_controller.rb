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

    Item.create(name: item_params[:name],
                description: item_params[:description],
                price: item_params[:price],
                inventory: item_params[:inventory],
                image: item_params[:image],
                active: true,
                merchant_id: @merchant.id,
              )

    redirect_to "/merchants/#{@merchant.id}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])

    item.update(item_params)

    redirect_to "/items/#{item.id}"
  end

  def destroy
    Item.destroy(params[:id])

    redirect_to "/items"
  end

  private
  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end

end
