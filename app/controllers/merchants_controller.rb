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
    merchant = Merchant.new(merchant_params)

    missing_params = []
    params.each do |param, value|
      if value.empty?
        missing_params << param.titlecase
      end
    end
    missing_params.join(', ')


    if merchant.save
      redirect_to "/merchants"
    else
      flash[:notice] = "Merchant not created: The following fields were not entered or entered incorrectly: #{missing_params}"
      render :new
    end
  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
