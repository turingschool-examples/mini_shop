class ItemsController < ApplicationController

  def index
    @items = Item.all
    # if params[:merchant_id]
    #   @merchant = Merchant.find(params[:merchant_id])
    #   @items = @merchant.items
    # else
    #    @items = Item.all
    #
    # end
  end

  def merchant_index
    @items = Item.where(merchant_id: params[:merchant_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end
end
