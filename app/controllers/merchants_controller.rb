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

  def edit
    @merchant = Merchant.find(params[:id])
    # binding.pry
  end

  def update
    @merchant.update({
      name: params[:merchant][:name],
      address: params[:merchant][:address],
      city: params[:merchant][:city],
      state: params[:merchant][:state],
      zip: params[:merchant][:zip],
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

end
