class Item < ApplicationRecord
  belongs_to :merchant
  # Trying to write class method to provide the Status field as Active or
  # Inactive in view but kept as a boolean
  # def self.status
  #   if status = true
  #     'Active'
  #   else
  #     'Inactive'
  #   end
  # end
end
