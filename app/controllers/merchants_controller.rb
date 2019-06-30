class MerchantsController < ApplicationController
  before_action :get_merchant, only: [:show, :edit]

  def index
    @merchants = Merchant.all
  end

  def show
  end

  def new
  end

  def create
    Merchant.create!(merchant_params)
    redirect_to merchants_path
  end

  def edit
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    merchant.save
    redirect_to merchant_path(merchant)
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to merchants_path
  end

  def items
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zipcode)
  end

  def get_merchant
    @merchant = Merchant.find(params[:id])
  end
end
