class Item < ApplicationRecord
  validates_presence_of :name, :description, :price, :image, :active, :inventory, :merchant_name

  belongs_to :merchant
end
