class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
    @new_merchant = Merchant.new
  end

  def create
    Merchant.create(merchant_params)
    redirect_to "/merchants"
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
       if @merchant.update_attributes(merchant_params)
         redirect_to "/merchants/#{@merchant.id}"
       else
         render 'edit'
       end

  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end



end
