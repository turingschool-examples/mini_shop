class MerchantsController < ApplicationController

  def index
    @merchants = ['merchant 1', 'merchant 2', 'merchant 3']
  end

  def new

  end

  def create
    binding.pry
    merchant = Merchant.new({
      name: params[:merchant][:name],
      address: params[:merchant][:address],
      city: params[:merchant][:city],
      state: params[:merchant][:state],
      zip: params[:merchant][:zip]
    })
    binding.pry
    merchant.save
    binding.pry
    redirect_to '/merchants'
  end

end
