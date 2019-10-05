class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new

  end

  def create
    merchant = Merchant.create({name: params[:merchant][:name],
                             address: params[:merchant][:address],
                             city: params[:merchant][:city],
                             state: params[:merchant][:state],
                             zip: params[:merchant][:zip]})
    redirect_to '/merchants'
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
      zip: params[:merchant][:zip],
      })

    merchant.save
    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  def items
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items
  end
end
