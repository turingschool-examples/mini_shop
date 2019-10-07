class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
    @merchant = Merchant.new
  end

  def create
    merchant = Merchant.create(merchant_params)

    redirect_to "/merchants"
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
    params.require(:merchant).permit(Merchant.column_names)
  end


end
