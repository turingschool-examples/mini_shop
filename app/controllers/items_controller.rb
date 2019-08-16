require 'pry'
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def list
    @merchant = Merchant.find(params[:id])
    # binding.pry
  end
end
