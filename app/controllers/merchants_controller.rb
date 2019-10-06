class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
    #necessary if using a form_for in the New view.
    # @merchant = Merchant.new
  end

  def create
    Merchant.create(merchant_params)

    redirect_to '/merchants'
  end

  def edit
     @merchant = Merchant.find(params[:id])
  end

  def update
    #find merchant first and assign a variable to it 'merchant'.
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params_form)

    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    
    redirect_to '/merchants'
  end

  private
    def merchant_params
      #require isn't necessary when using a form tag. Will use permit instead.
      #Use for traditional HTML form views || form_for
      params.require(:merchant).permit(:name, :address, :city, :state, :zip)
    end

    def merchant_params_form
      #Use for form_tag views
      params.permit(:name, :address, :city, :state, :zip)
    end
end
