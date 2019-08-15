class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def merchant_index
    @items = Item.where(merchant_id: params[:merchant_id])
  end

end
