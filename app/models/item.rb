class Item < ApplicationRecord
  validates_presence_of :name, :description, :price, :image, :inventory
  belongs_to :merchant

  def self.filter_by_active(merchant, active)
    if active == "true"
      return merchant.items.select {|item| item.active}
    elsif active == "false"
      return merchant.items.select {|item| !item.active}
    elsif active.nil?
      return merchant.items
    end
  end
end
