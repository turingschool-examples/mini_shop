require "rails_helper"

RSpec.describe "merchants creation page", type: :feature do
  it "user can create merchant" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)

    visit "/merchants/new"

    fill_in "merchant_name", with: merchant_1.name
    fill_in "merchant_address", with: merchant_1.address
    fill_in "merchant_city", with: merchant_1.city
    fill_in "merchant_state", with: merchant_1.state
    fill_in "merchant_zip", with: merchant_1.zip
  end
end
