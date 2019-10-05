class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @items = Item.where(merchant: @merchant)
  end

  def new
    @merchant = Merchant.find(params[:id])
  end
end