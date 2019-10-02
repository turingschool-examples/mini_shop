require 'rails_helper'

describe "merchants show page", type: :feature do
  it "can see a merchant based off an id" do
    merchant_1 = Merchant.create(name: "Hills Shop",
                                address: "not cool place",
                                city: "denver",
                                state: "colorado",
                                zip: "80210")

      visit "/merchants/#{merchant_1.id}"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_1.address)
      expect(page).to have_content(merchant_1.city)
      expect(page).to have_content(merchant_1.state)
      expect(page).to have_content(merchant_1.zip)
  end
end
