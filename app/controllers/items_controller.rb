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
end
