class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :image_url
  validates_presence_of :status
  validates_presence_of :inventory

  def self.status(value)
    if value == 0
       "Active"
    else
       "Inactive"
    end
  end



end
