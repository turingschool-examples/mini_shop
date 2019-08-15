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
    Merchant.create!(merchant_params)
    redirect_to '/merchants'
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  # def update
  #   task = Task.find(params[:id])
  #   task.update({
  #     title: params[:task][:title],
  #     description: params[:task][:description]
  #     })
  #   task.save
  #   redirect_to "/tasks/#{task.id}"
  # end
  #
  # def destroy
  #   Task.destroy(params[:id])
  #   redirect_to '/tasks'
  # end

  private
  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
