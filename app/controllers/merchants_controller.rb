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
   @merchant = Merchant.create(merchant_params)
   redirect_to "/merchants"
 end

 def edit
  @merchant = Merchant.find(params[:id])
end

def update
  @merchant = Merchant.find(params[:id])
  @merchant.update(merchant_params) #active record method update
    # binding.pry
    redirect_to "/merchants/#{@merchant.id}"
end


  def destroy
     merchant = Merchant.destroy(params[:id])
     redirect_to "/merchants"
   end

private #makes everything blow this private methods
def merchant_params
  params.permit(:name, :address, :city, :state, :zip)
end

end
