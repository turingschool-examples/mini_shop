class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant= Merchant.find(params[:id])
  end

  def new
  end

  def create
   @merchant = Merchant.new(merchant_params)
   if @merchant.save #if the merchant is saved, go back to merchants index
     redirect_to "/merchants"
   end
 end

private

def merchant_params
  params.permit(:name, :address, :city, :state, :zip)
end

end
