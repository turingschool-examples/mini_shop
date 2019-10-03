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

  end

  private
  
  def merchant_params
    params.permit(:name)
    params.permit(:address)
    params.permit(:city)
    params.permit(:state)
    params.permit(:zip)
  end

end