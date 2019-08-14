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
    merchant = Merchant.new(merchant_params)
    merchant.save
    redirect_to '/merchants'
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :address, :city, :state, :zip)
  end
end
