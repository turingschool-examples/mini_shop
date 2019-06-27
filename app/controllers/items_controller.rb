class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @items = Merchant.find(params[:id]).items
  end

end
