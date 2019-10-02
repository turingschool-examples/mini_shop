require 'rails_helper'

describe Merchant, type: :model do
  describe "validations" do
    it { should validate_presence_of :name } 
    it { should validate_presence_of :address } 
    it { should validate_presence_of :city } 
    it { should validate_presence_of :state } 
    it { should validate_presence_of :zip } 
  end

  # describe "relationships" do 
  #   it { should have_many :items }
  # end

  # describe "class methods" do 
  #   it ".method_name" do
  #     setup
  #     expect(Merchant.method_name).to eq(value)
  #   end
  # end

end