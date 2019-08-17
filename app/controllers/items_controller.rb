class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
    else
      @items = Item.all
    end
    @items = sort_items(@items, params[:sort]) if params[:sort]
  end

  def sort_items(items, method)
    if method == 'a-z'
      items.sort_by { |item| item.name }
    elsif method == 'z-a'
      items.sort_by { |item| item.name }.reverse
    elsif method == 'min-price'
      items.sort_by { |item| item.price }
    elsif method == 'max-price'
      items.sort_by { |item| item.price }.reverse
    end
  end

  def show
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.items.create(item_params)
    redirect_to "/merchants/#{merchant.id}/items"
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to "/items/#{@item.id}"
  end

  def destroy
    @item.destroy
    redirect_to '/items'
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :inventory)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
