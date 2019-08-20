class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name, :description, :price, :image, :inventory
  validates_inclusion_of :status, :in => [true, false]
end
