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

 def edit
  @merchant = Merchant.find(params[:id])
end

def update
  @merchant = Merchant.find(params[:id])
  if @merchant = Merchant.update(merchant_params)
    redirect_to "/merchants/#{@merchant.first.id}"
  end
end


private #makes everything blow this private methods

def merchant_params
  params.permit(:name, :address, :city, :state, :zip)
end

end
