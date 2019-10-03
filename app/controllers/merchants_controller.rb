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
    Merchant.create({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
      })

      redirect_to '/merchants'
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    merchant.save
    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  private
    def merchant_params
      params.permit(:name, :address, :city, :state, :zip)
    end

end