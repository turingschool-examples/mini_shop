class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name, :description, :price, :image, :inventory
  validates_inclusion_of :active, :in => [true, false]

  def status
    self.active ? 'Active' : 'Inactive'
  end
end
