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

  def edit
  @item = Item.find(params[:id])
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to "/items/#{@item.id}"
  end
end

def destroy
  Item.destroy(params[:id])
  redirect_to '/items'
end

def create
  @merchant = Merchant.find(params[:merchant_id])
  @item = @merchant.items.create!(item_params)
  # @item.status = true;
  redirect_to "/merchants/#{@merchant.id}/items"
end


private
def item_params
  params.permit(:name, :price, :description, :inventory, :image, :status)
end
end
