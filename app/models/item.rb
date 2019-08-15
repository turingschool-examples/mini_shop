class Item < ApplicationRecord
  belongs_to :merchant
  # validates_presence_of :name, :address, :city, :state, :zip
end
