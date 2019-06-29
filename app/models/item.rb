class Item < ApplicationRecord
  validates_presence_of :name, :description, :price, :image, :inventory, :merchant_id

  belongs_to :merchant
end
