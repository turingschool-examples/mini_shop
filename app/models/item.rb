class Item < ApplicationRecord
  validates_presence_of :name, :description, :price, :active, :inventory

  belongs_to :merchant
end
