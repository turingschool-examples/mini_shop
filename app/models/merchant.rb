class Merchant < ApplicationRecord
  has_many :items

  validates_presence_of :name, :address, :city, :state, :zip

  def active_items(status)
    items.select {|item| item.active == status}
  end
end
