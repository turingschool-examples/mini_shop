class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new
  end

  def create
    Merchant.create(merchant_params)
    redirect_to '/merchants'
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
  end

  def update
    merchant = Merchant.find(params[:merchant_id])

    if merchant.update(merchant_params)
      redirect_to "/merchants/#{merchant.id}"
    else
      redirect_to "/merchants/#{params[:merchant_id]}/edit"
    end
  end

  def destroy
    Merchant.destroy(params[:merchant_id])
    redirect_to '/merchants'
  end

  private
  def merchant_params
    params.permit(:name,:address,:city,:state,:zip)
  end
end
