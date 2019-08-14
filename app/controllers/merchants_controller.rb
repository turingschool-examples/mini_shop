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
    Merchant.create(merchant_params)
    redirect_to merchants_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
