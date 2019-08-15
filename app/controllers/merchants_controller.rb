class MerchantsController < ApplicationController
  def index
    @merchants = ['Moose Munchies', 'Eh Plus School Supplies', 'Two-Four Liquors']
  end

  def show
    @merchant = Merchant.find(params[:id])
  end
end
