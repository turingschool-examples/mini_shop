require 'rails_helper'

RSpec.describe "Merchants Index" do
  describe "As a visitor" do
    it "I see the name of each merchant in the system" do
      merchant_1 = Merchant.create(name: "Carl's Cyclery")
      merchant_2 = Merchant.create(name: "What Ales You")
      merchant_3 = Merchant.create(name: "The Gracious Tome")

      visit "/merchants"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content(merchant_3.name)
    end
  end
end
