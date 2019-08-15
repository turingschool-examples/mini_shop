class MerchantsController < ApplicationController
  def index
    @merchants = ['Moose Munchies', 'Eh Plus School Supplies', 'Two-Four Liquors']
  end

  def new
    @merchant = Merchant.new
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.create!(merchant_params)
    redirect_to "/merchants"
  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
