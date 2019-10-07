class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :price,
                        :image,
                        :inventory
  validates_inclusion_of :active?, in: [true, false]
  belongs_to :merchant
end
