class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    #handle this logic with a case calling model methods
    if params[:merchant_id].nil?
      @items = Item.all
    else
      @merchant = Merchant.find(params[:merchant_id])
      if params[:active] == "true"
        @items = @merchant.items.select {|item| item.active}
      elsif params[:active] == "false"
        @items = @merchant.items.select {|item| !item.active}
      elsif params[:active].nil?
        @items = @merchant.items
      end
    end
  end

  def show
  end

  def new
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    @item = merchant.items.create!(item_params)
    redirect_to merchant_items_path(merchant)
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :active, :inventory)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
