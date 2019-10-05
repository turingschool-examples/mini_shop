class Item < ApplicationRecord
  validates_presence_of :name, :description, :price, :image_url, :inventory, :merchant_id
  validates :status, inclusion: { in: [true,false] }
  belongs_to :merchant


end
