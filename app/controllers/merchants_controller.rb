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
    merchant = Merchant.new({
      name: params[:merchant][:name],
      address: params[:merchant][:address],
      city: params[:merchant][:city],
      state: params[:merchant][:state],
      zip: params[:merchant][:zip]
      })

      merchant.save

      redirect_to '/merchants'
  end

end