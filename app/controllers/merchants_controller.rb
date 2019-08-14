class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new
  end

  def create
    merchant = Merchant.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      })
      merchant.save
      redirect_to '/merchants'
  end

  def show
    @merchant = Merchant.find(params[:id])
  end
end
