class Item < ApplicationRecord
  validates_presence_of :name, :merchant_id
  belongs_to :merchant
end
