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

  def create
    @merchant = Merchant.new
    @merchant.name = params[:merchant][:name]
    @merchant.address = params[:merchant][:address]
    @merchant.city = params[:merchant][:city]
    @merchant.state = params[:merchant][:state]
    @merchant.zip = params[:merchant][:zip]
    @merchant.save

    redirect_to "/merchants/#{@merchant.id}"
  end

end
