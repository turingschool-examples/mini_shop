require 'rails_helper'

describe Item, type: :model do
  #validations
  describe "validations" do
    it { should validate_presence_of  :name, :description, :image, :price,
                                      :active, :inventory, :merchant
        }
    end
    
  # relationships
  describe "relationships" do
    it { should belong_to :merchant }
  end
end
