class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
  end

  def update
    merchant = Merchant.find(params[:id])

    merchant.update({name: params[:merchant][:name],
                                  address: params[:merchant][:address],
                                  city: params[:merchant][:city],
                                  state: params[:merchant][:state],
                                  zip: params[:merchant][:zip]})

    merchant.save
    redirect_to '/merchants'
  end

  def create
    merchant = Merchant.create({name: params[:merchant][:name],
                              address: params[:merchant][:address],
                              city: params[:merchant][:city],
                              state: params[:merchant][:state],
                              zip: params[:merchant][:zip]})


    redirect_to '/merchants'
  end
  
  def edit
    @merchant = Merchant.find(params[:id])
  end

  def delete
    Merchant.delete(params[:id])

    redirect_to '/merchants'
  end
end
