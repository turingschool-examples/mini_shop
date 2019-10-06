class MerchantItemsController < ItemsController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end
end
