class MerchantsController < ApplicationController

def index
  @merchants = Merchant.all
end

def show
  #instance variables used to pass to the view
  @merchant = Merchant.find(params[:id])
end

end
