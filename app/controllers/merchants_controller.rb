class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def create
    Merchant.create(merchant_params)
    redirect_to '/merchants'
  end

  def new
    @merchant = Merchant.new
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

private

  def merchant_params
   params.permit(:name, :address, :city, :state, :zipcode)
  end

end
