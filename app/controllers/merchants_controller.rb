class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort] == 'a-z'
      @merchants = Merchant.order(:name)
    elsif params[:sort] == 'z-a'
      @merchants = Merchant.order(name: :desc)
    else
      @merchants = Merchant.all
    end
  end

  def show
  end

  def new
  end

  def create
    merchant = Merchant.new(merchant_params)
    merchant.save
    redirect_to '/merchants'
  end

  def edit
  end

  def update
    @merchant.update(merchant_params)
    redirect_to "/merchants/#{@merchant.id}"
  end

  def destroy
    @merchant.items.destroy_all
    @merchant.destroy
    redirect_to '/merchants'
  end

  private

  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end
end
