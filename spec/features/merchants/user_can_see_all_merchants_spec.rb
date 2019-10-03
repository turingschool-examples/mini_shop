require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "can see all merchants in the system" do
    merchant_1 = Merchant.create(name: "Sedona", address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218)
    merchant_2 = Merchant.create(name: "Fun Fitness", address: '75 Springride Meadows', city: 'Los Angeles', state: 'CA', zip: 90040)

  visit "/merchants"

  expect(page).to have_link(merchant_1.name)
  expect(page).to have_link(merchant_2.name)
  end
end
