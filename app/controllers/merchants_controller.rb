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

  def update
    merchant = Merchant.find(params[:id])

    merchant.update({
      name: params[:merchant][:name],
      address: params[:merchant][:address],
      city: params[:merchant][:city],
      state: params[:merchant][:state],
      zip: params[:merchant][:zip],
      })

    merchant.save
    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.items.destroy_all
    merchant.destroy
    redirect_to '/merchants'
  end

  def items
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items
  end

  def item_new
    @merchant_id = Merchant.find(params[:merchant_id]).id
  end

  def item_create
    merchant = Merchant.find(params[:id])
    item = merchant.items.create({name: params[:name],
                                  description: params[:description],
                                  image: params[:image_url],
                                  price: params[:price],
                                  inventory: params[:inventory],
                                  status: 'active'})
    redirect_to "/merchants/#{merchant.id}/items"
  end
end
