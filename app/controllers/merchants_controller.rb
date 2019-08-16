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
    (Merchant.find(params[:id]).items).destroy_all
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  def items
    if params[:active] == "true"
      items = Merchant.find(params[:id]).items
      @merchant_items = items.first.merchant.active_items(true)
    elsif params[:active] == "false"
      items = Merchant.find(params[:id]).items
      @merchant_items = items.first.merchant.active_items(false)
    else
      @merchant_items = Merchant.find(params[:id]).items
    end
    @merchant = Merchant.find(params[:id])
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
