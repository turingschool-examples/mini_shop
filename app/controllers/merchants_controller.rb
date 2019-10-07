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
    merchant = Merchant.find(params[:id])
    merchant.items.destroy_all
    merchant.destroy

    redirect_to '/merchants'
  end

  def items_index
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items
  end

  def item_new
    @merchant = Merchant.find(params[:id])
  end
end
