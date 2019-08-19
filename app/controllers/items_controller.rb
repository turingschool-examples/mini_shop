class ItemsController < ApplicationController
  def index
    if params[:merchant_id].nil?
      @items = Item.all
    else
      @merchant = Merchant.find(params[:merchant_id])

      @items = @merchant.items
    end
  end

  def show
    @item = Item.find(params[:id])
    @merchant = Merchant.find(@item.merchant_id)
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    binding.pry
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    Item.update(item_params)
    redirect_to "/items/#{@item.id}"
  end

  private
  def item_params
    params.permit(:name, :price, :description, :image, :inventory)
  end
end
