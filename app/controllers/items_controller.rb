class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    @item = merchant.items.create(params_as_item_hash)
    redirect_to "/merchants/#{merchant.id}/items"
  end

  def edit
    @item_id = params[:item_id]
  end

  def update
    item = Item.find(params[:item_id])
    item.update(params_as_item_hash)

    redirect_to "/items/#{item.id}"
  end

  private
  def item_params
    params.permit( :name,
                    :price,
                    :description,
                    image: :url,
                    item: :inventory,
                  )
  end

  def params_as_item_hash
    item_hash = item_params.to_h
    item_hash[:price] = item_hash[:price].to_f
    item_hash[:image] = item_hash[:image][:url]
    item_hash[:inventory] = item_hash[:item][:inventory]
    item_hash[:status] = 'Active'
    item_hash.delete(:item)
    item_hash
  end

end
