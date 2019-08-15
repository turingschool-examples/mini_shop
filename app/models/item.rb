class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name, :description, :price, :image, :active, :inventory

  def status
    self.active ? 'Active' : 'Inactive'
  end
end
