class Item < ApplicationRecord
  belongs_to :merchant, dependent: :destroy
  # validates_presence_of :name, :address, :city, :state, :zip
end
