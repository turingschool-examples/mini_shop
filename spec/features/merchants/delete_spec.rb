require 'rails_helper'

describe "As a visitor" do
  before :each do
  @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
  @merchant_2 = Merchant.create(name: "merchant_2", address: "456 Main", city: "Denver", state:"CO", zip:"80214")
end

  describe "when I visit '/merchants/:id'" do
    it "Then I see the merchant with that id including" do
      visit "/merchants/#{@merchant_1.id}"
      expect(page).to have_link("Delete")

      click_on("Delete")
      
      expect(current_path).to eq("/merchants")

      expect(page).to_not have_content("merchant_1")
    end
  end
end
