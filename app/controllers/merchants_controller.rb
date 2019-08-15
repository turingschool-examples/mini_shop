class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
    @merchant = Merchant.new
  end


  def destroy
    @merchant = Merchant.find(params[:id])

    @merchant.destroy
    redirect_to "/merchants"
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])

    @merchant.update({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      })
    redirect_to "/merchants/#{@merchant.id}"
  end

  def create
    merchant = Merchant.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      })
    merchant.save
    redirect_to "/merchants"
  end

  def item_index
    @merchant = Merchant.find(params[:id])
    @merchant.items
  end

  def new_item
  end

  def create_new_item

    item = Item.new({
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image],
      inventory: params[:inventory],
      })
    item.save
    redirect_to "/merchants/#{item.merchant_id}/items"
  end


end
