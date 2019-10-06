require 'rails_helper'

#RSpecdescribe Merchant, type: :model do ## this makes the test not work
describe Merchant, type: :model do

  before(:each) do
    @merchant_1 = Merchant.create(name:"scott", address:"4942 willow", city:"denver", state: "co", zip:"90210")
  end

  describe "validations" do
    it { should validate_presence_of :name }
    # Merchant.create(name:"scott", address:"4942 willow", city:"denver", state: "co", zip:"90210")
  end
end
