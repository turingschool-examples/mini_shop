class MerchantsController < ApplicationController

  def index
    @merchants = ['merchant 1', 'merchant 2', 'merchant 3']
  end

end
