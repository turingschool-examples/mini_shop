class MerchantsController < ApplicationController

def index
  @merchants = Merchant.all
  # pry
end

end
