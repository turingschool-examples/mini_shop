class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def new
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    @merchant.update(merchant_params)
    @merchant.save
    redirect_to "/merchants/#{@merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  def create
    @merchant = Merchant.new(merchant_params)
    @merchant.save
    redirect_to '/merchants'
  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end



end
