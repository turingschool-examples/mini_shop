require 'rails_helper'

RSpec.describe "Merchants Index" do
  describe "As a visitor" do
    it "I see the name of each merchant in the system" do
      merchant_1 = Merchant.create(
        name: "Knees Weak",
        address: "1 Oppurtunity Way",
        city: "Denver",
        state: "Colorado",
        zip: 80229
      )

      merchant_2 = Merchant.create(
        name: "Mom's Spaghetti",
        address: "1 Moment Way",
        city: "Las Vegas",
        state: "Nevada",
        zip: 80003
      )

      visit "/merchants"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end
end
