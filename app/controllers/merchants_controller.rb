class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :destroy, :edit, :update]

  def index
    @merchants = Merchant.all
  end

  def show
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.create!(merchant_params)
    flash.notice = "Article #{@merchant.name} Created!"
    redirect_to merchants_path
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :address, :city, :state, :zip)
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end
end
