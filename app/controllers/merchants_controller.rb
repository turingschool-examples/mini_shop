class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  # def new
  # end
  #
  # def create
  #   merchant = Merchant.new({
  #     title: params[:task][:title],
  #     description: params[:task][:description]
  #     })
  #
  #   merchant.save
  #
  #   redirect_to '/merchants'
  # end
  #
  # def edit
  #   @merchant = Merchant.find(params[:id])
  # end
  #
  # def update
  #   merchant = Merchant.find(params[:id])
  #   merchant.update({
  #     title: params[:merchant][:title],
  #     description: params[:merchant][:description]
  #     })
  #   merchant.save
  #   redirect_to "/merchants/#{merchant.id}"
  # end
  #
  # def destroy
  #   Merchant.destroy(params[:id])
  #   redirect_to '/merchants'
  # end
end
