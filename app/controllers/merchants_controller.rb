require 'pry'
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
    Merchant.create(merchant_params)
    redirect_to '/merchants'
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    @merchant.update({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip]
      })
    @merchant.save
    redirect_to "/merchants/#{@merchant.id}"
  end

  def destroy
    #Item.destroy(params[:merchant_id])
    #Item.where(:merchant_id => Merchant.find(params[:id]).destroy_all
    #@merchant = Merchant.find(params[:id])
    #@items = @merchant.items.find(params[:merchant_id])
    #@merchant.items.delete(@items)
    Merchant.destroy(params[:id])
    redirect_to '/merchants'

    #@merchant = Merchant.find(params[:id])
    #@merchant.destroy
    #redirect_to '/merchants'
  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
