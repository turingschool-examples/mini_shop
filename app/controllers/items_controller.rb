class ItemsController < ApplicationController

  def index
    if params.has_key?(:id)
      @items = Item.where(merchant_id: params[:id])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

end
