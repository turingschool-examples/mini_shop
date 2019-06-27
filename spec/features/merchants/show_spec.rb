require 'rails_helper'

RSpec.describe "Merchants Show" do
  describe "As a visitor" do
    it "I see the merchant with that id including the merchant's\n
    -name\n
    -address\n
    -city\n
    -state\n
    -zip" do

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

    merchant_3 = Merchant.create(
      name: "So Loud",
      address: "8 Mile rd",
      city: "Los Angeles",
      state: "California",
      zip: 99482
    )

    merchant_4 = Merchant.create(
      name: "Calm and Ready",
      address: "1 Shot Way",
      city: "St. Paul",
      state: "Minnesota",
      zip: 82783
    )

    visit "/merchants/#{merchant_1.id}"

    within("#merchant-#{merchant_1.id}") do
      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content("Address: #{merchant_1.address}")
      expect(page).to have_content("City: #{merchant_1.city}")
      expect(page).to have_content("State: #{merchant_1.state}")
      expect(page).to have_content("Zip: #{merchant_1.zip}")
    end

    visit "/merchants/#{merchant_2.id}"

    within("#merchant-#{merchant_2.id}") do
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content("Address: #{merchant_2.address}")
      expect(page).to have_content("City: #{merchant_2.city}")
      expect(page).to have_content("State: #{merchant_2.state}")
      expect(page).to have_content("Zip: #{merchant_2.zip}")
    end

    visit "/merchants/#{merchant_3.id}"

    within("#merchant-#{merchant_3.id}") do
      expect(page).to have_content(merchant_3.name)
      expect(page).to have_content("Address: #{merchant_3.address}")
      expect(page).to have_content("City: #{merchant_3.city}")
      expect(page).to have_content("State: #{merchant_3.state}")
      expect(page).to have_content("Zip: #{merchant_3.zip}")
    end

    visit "/merchants/#{merchant_4.id}"

    within("#merchant-#{merchant_4.id}") do
      expect(page).to have_content(merchant_4.name)
      expect(page).to have_content("Address: #{merchant_4.address}")
      expect(page).to have_content("City: #{merchant_4.city}")
      expect(page).to have_content("State: #{merchant_4.state}")
      expect(page).to have_content("Zip: #{merchant_4.zip}")
    end

    end
  end
end
