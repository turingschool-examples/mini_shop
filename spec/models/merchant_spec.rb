require 'rails_helper'

describe Merchant, type: :model do
  #validations
  describe "validations" do
    it { should validate_presence_of :name}
  end

  #relationships
  describe "relationships" do
    it {should have_many :items}
  end
end
