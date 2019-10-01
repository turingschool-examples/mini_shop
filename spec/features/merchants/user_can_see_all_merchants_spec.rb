require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "can see all merchants in the system" do
    merchant_1 = Merchant.create(name: "Seller of the best things")
    merchant_2 = Merchant.create(name: "Fun Seller")

  visit "/merchants"

  expect(page).to have_content(merchant_1.name)
  expect(page).to have_content(merchant_2.name)
  end
end
