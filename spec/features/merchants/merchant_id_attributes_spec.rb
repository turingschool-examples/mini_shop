require 'rails_helper'

RSpec.describe "merchants id page", type: :feature do
  it "can see merchant attributes by id" do
    merchant_1 = Merchant.create(name: "Bob's Cookies", address: "123 Cookie Dr", city: "Orlando", state: "FL", zip: 32810)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
  end
end
