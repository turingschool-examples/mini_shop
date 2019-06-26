class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    # binding.pry
    @merchant = Merchant.find(params[:id])
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end
end
