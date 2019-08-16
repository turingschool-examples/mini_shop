require 'pry'
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def list
    @merchant = Merchant.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:id])
    Item.create(item_params)
    redirect_to "/merchants/#{@merchant.id}/items"
  end

  private
  def item_params
    params.permit(:name, :description, :price, :image, :status, :inventory, :merchant_id)
  end
end
