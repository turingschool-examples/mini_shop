class MerchantsController < ApplicationController

  def index
    @merchants = ['Montys Mercantile', 'CoCos Collectables', 'Georgios Goodies']
  end

end