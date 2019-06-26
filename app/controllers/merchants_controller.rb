class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.new({
      name: params[:merchant][:name],
      address: params[:merchant][:address],
      city: params[:merchant][:city],
      state: params[:merchant][:state],
      zipcode: params[:merchant][:zipcode]
      })

    merchant.save
    redirect_to '/merchants'
  end

  def new
    @merchant = Merchant.new
    # @merchant.save
    # redirect_to "/merchants/#{merchant.id}"
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

end
