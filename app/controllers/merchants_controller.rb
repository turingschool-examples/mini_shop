class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]

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
    redirect_to merchants_path
  end

  def edit
  end

  def update
    @merchant.update(merchant_params)
    redirect_to merchant_path(@merchant)
  end

  def destroy
    @merchant.destroy
    redirect_to merchants_path
  end

  private

  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end
end
