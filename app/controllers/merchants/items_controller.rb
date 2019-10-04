class Merchants::ItemsController < ApplicationController
  def index
    @merchant = Merchant.all
    @items = Item.where(merchant: @merchant)
  end
end