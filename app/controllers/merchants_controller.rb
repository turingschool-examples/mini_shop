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
    @merchant = Merchant.create(merchant_params)
    redirect_to "/merchants"
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    redirect_to "/merchants"
  end

  def delete
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  def items
    @merchant_items = Merchant.find(params[:id]).items
  end

  def active_items
    @items = Merchant.find(params[:id]).active_items(true)
  end

  def inactive_items
    @items = Merchant.find(params[:id]).active_items(false)
  end

  private

  def merchant_params
    params.permit(:name,:address,:city,:state,:zip)
  end

end
