class Merchant < ApplicationRecord
  validates :name, presence: true, uniqueness: true 
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: { only_integer: true}
end
