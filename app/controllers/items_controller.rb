class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  

end
