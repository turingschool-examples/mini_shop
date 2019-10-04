class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :image
  validates_presence_of :active
  validates_presence_of :inventory
  validates_presence_of :merchant_id

  belongs_to :merchant
end