# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[show edit update destroy]

  # GET /merchants
  def index
    @merchants = Merchant.all
  end

  # GET /merchants/1
  def show; end

  # GET /merchants/new
  def new
    @merchant = Merchant.new
  end

  # GET /merchants/1/edit
  def edit; end

  # POST /merchants
  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Merchant was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /merchants/1
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url, notice: 'Merchant was successfully destroyed.' }
    end
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(:name, :address, :city, :state, :zip)
  end
end
