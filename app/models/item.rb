class Item < ApplicationRecord
  validates_presence_of :name, :description, :price, :image, :inventory, :merchant_id

  belongs_to :merchant

  def in_stock
    if active == true
      "In stock"
    else
      "Out of stock"
    end
  end
end
