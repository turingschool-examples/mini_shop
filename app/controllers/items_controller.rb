class ItemsController < ApplicationController

    def index

      if params[:merchant_id]
          @items = Merchant.find(params[:merchant_id]).items
        else
          @items = Item.all
      end

    end

    def show
      @item = Item.find(params[:id])
    end

    def new
      @merchant_id = params[:merchant_id]
    end

    def create
      merchant = Merchant.find(params[:merchant_id])
      item = merchant.items.create!(items_params)
      redirect_to "/merchants/#{item.merchant_id}/items"
    end

    private

    def items_params
      params.permit(:name, :description, :price, :image_url, :status, :inventory)
    end

end
