class Item < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :name, :description, :price, :image, :inventory

  def active?
    if self.inventory > 0
      self.active = true
    else
      self.active = false
    end
  end
  
end
