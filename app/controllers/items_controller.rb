class ItemsController < ApplicationController

  def index
    @active = params[:active]

    if @active == nil
      @items = Item.all
    else
      @items = Item.where(active_status: @active)
    end

    if params[:sort] == 'alpha'
      @items = @items.sort_by { |item| item.name }
    elsif params[:sort] == 'price_asc'
      @items = @items.sort_by { |item| item.price }
    elsif params[:sort] == 'price_desc'
      @items = @items.sort_by { |item| item.price }.reverse
    end
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    redirect_to "/items/#{item.id}"
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to '/items'
  end

  def deactivate
    item = Item.find(params[:id])
    item.update(active_status: false)

    redirect_to "/items/#{item.id}"
  end

  def activate
    item = Item.find(params[:id])
    item.update(active_status: true)

    redirect_to "/items/#{item.id}"
  end

  private
  def item_params
    params
      .require(:item)
      .permit(:name, :description, :price, :image, :inventory)
  end

end
