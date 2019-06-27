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

end
