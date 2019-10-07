class Item < ApplicationRecord
  validates_presence_of :name, :description, :price, :image, :status, :inventory, :merchant_name
  belongs_to :merchant
end