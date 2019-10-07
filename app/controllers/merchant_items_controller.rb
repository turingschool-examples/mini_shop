class MerchantItemsController < ItemsController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def new
    @merchant_id = params[:merchant_id]
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.items.create(item_params)
    redirect_to "/merchants/#{params[:merchant_id]}/items"
  end

  private
  def item_params
    params.permit(:name,:description,:price,:image_url,:inventory)
  end
end
