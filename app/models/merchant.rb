class Merchant < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zipcode

  has_many :items
end
