class MerchantsController < ApplicationController
  #before_action :set_merchant, only: [:show, :destroy, :edit, :update]

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
    @merchant = Merchant.new(merchant_params)
    @merchant.save!
    redirect_to merchants_path
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :address, :city, :state, :zip)
  end
end
