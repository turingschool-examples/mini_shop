require 'rails_helper'

describe Item, type: :model do
  #validations
  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :merchant_id}
  end

  #relationships
  describe "relationships" do
    it {should belong_to :merchant}
  end
