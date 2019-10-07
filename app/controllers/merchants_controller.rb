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
    Merchant.create(merchant_params)
    redirect_to '/merchants'
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])

    if merchant.update(merchant_params)
      redirect_to "/merchants/#{params[:id]}"
    else
      redirect_to "/merchants/#{params[:id]}/edit"
    end
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  private
  def merchant_params
    params.permit(:name,:address,:city,:state,:zip)
  end
end
