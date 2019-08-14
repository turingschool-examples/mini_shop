class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchants.find(params[:id])
  end
end
