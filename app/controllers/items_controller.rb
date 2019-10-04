class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  #merchant_items_controller

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    all_params = {"merchant_id" => params[:id]}
    all_params.merge!(item_params)


    item = Item.create(all_params)

    redirect_to "/merchants/#{params[:id]}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    item.save
    redirect_to "/items/#{params[:id]}"
  end

  def destroy
    Item.destroy(params[:id])

    redirect_to '/items'
  end

  private

  def item_params
    params.require(:item).permit(Item.column_names)
  end


end
