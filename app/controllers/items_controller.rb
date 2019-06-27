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
      @item = Merchant.find(params[:merchant_id]).items.new
    end

    def create
      Merchant.find(params[:merchant_id]).items.create(items_params)
      redirect_to "/merchants/:merchant_id/items"
    end

    # private
    #
    # def items_params
    #   params.permit(:name, :description, :price, :image_url, status: 0, :inventory)
    # end

end
