class Merchant < ApplicationRecord
  has_many :items, dependent: :delete_all

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
end
