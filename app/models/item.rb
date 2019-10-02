class Item < ApplicationRecord
  validates_presence_of :name,
                       :description,
                       :price,
                       :image,
                       :inventory
                       
  validates_inclusion_of :active_status, in: [true, false]
  belongs_to :merchant
end
