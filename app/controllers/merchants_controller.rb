class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.create!(merchant_params)
    merchant.save
    redirect_to "/merchants"
  end

  def update
  end 

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
