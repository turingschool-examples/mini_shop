require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "can see all merchants" do
    merchant_1 = Merchant.create(name: "Bob's Cookies", address: "123 Cookie Dr", city: "Orlando", state: "FL", zip: "32810")
    merchant_2 = Merchant.create(name: "Ruth's Cakes", address: "456 Cake St", city: "New Orleans", state: "LA", zip: "70010")

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
