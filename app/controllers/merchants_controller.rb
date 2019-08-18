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

    check_missing_params

    if @merchant.save
      redirect_to "/merchants"
    else
      flash[:notice] = "Merchant not created. The following fields were not entered or entered incorrectly: " + check_missing_params + "."
      render :new
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.update(merchant_params)
    @merchant = Merchant.find(params[:id])

    redirect_to "/merchants/#{@merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'

  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :zip, :state)
  end

  def check_missing_params
    missing_params = []
    params.each do |param, value|
      if value.empty?
        missing_params << param.titlecase
      end
    end
    missing_params.join(', ')
  end
end
