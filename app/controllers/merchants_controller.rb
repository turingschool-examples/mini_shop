class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def items_index
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items
  end

  def new
  end

  def new_item
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.new({
      name: params[:merchant][:name],
      address: params[:merchant][:address],
      city: params[:merchant][:city],
      state: params[:merchant][:state],
      zip: params[:merchant][:zip]
    })

    merchant.save
    redirect_to '/merchants'
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update({
      name: params[:merchant][:name],
      address: params[:merchant][:address],
      city: params[:merchant][:city],
      state: params[:merchant][:state],
      zip: params[:merchant][:zip]
    })

    merchant.save
    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

end
