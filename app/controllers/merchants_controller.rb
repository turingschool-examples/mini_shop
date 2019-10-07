class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    merchant = Merchant.create(merchant_params)
    redirect_to '/merchants'
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
  end

  def items
    @merchant = Merchant.find(params[:merchant_id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
  end

  def update
    merchant = Merchant.find(params[:merchant_id])
    merchant.update(merchant_params)

    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:merchant_id])

    redirect_to '/merchants'
  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
