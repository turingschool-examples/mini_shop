class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def items_index
    @merchant = Merchant.find(params[:merchant_id])
    @active = params[:active]

    if @active == nil
      @items = @merchant.items
    else
      @items = Item.where(merchant_id: @merchant.id, active_status: @active)
    end

    if params[:sort] == 'alpha'
      @items = @items.sort_by { |item| item.name }
    elsif params[:sort] == 'price_asc'
      @items = @items.sort_by { |item| item.price }
    elsif params[:sort] == 'price_desc'
      @items = @items.sort_by { |item| item.price }.reverse
    end
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

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)

    redirect_to "/merchants/#{merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'
  end

  private
  def merchant_params
    params
      .require(:merchant)
      .permit(:name, :address, :city, :state, :zip)
  end

end
