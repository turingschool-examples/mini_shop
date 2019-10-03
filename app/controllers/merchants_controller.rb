class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new
  end

#   def create
#     binding.pry
#   merchant = Merchant.new({
#     name: params[:task][:title],
#     description: params[:task][:description]
#     })
#   merchant.save
#   redirect_to '/merchants'
# end

  def show
    @merchant = Merchant.find(params[:id])
  end
end
