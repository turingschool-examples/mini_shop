require 'rails_helper'

describe "As a visitor" do
  before :each do
  @merchant_1 = Merchant.create(name: "merchant_1")
  @merchant_2 = Merchant.create(name: "merchant_2")
end

  describe "when I visit '/merchants'" do
    it "Then I see the name of each merchant in the system" do
      visit "/merchants"
      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
    end
  end

  describe "when I visit '/merchants/:id'" do
    it "Then I see the merchant with that id including" do
      visit "/merchants/:id"
    end
  end
end
