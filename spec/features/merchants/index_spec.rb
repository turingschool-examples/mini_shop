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

    it "I see a link to create a new merchant with info" do
      visit '/merchants'

      click_on 'New Merchant'

      fill_in 'Name', with: "Carl's Cyclery"
      fill_in 'Address', with: "123 Puma Drive"
      fill_in 'City', with: "Denver"
      fill_in 'State', with: "CO"
      fill_in 'Zip', with: "80210"

      click_button("Create Merchant")

      expect(page).to have_content("Carl's Cyclery")
    end

  end
end
