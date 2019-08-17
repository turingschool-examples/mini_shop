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

    if merchant.save
      redirect_to "/merchants"
    else
      flash[:notice] = "Merchant not created: Required information missing."
      render :new
    end
  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
