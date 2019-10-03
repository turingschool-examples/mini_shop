require 'rails_helper'

RSpec.describe "deleting a merchant" do
  it "can delete an existing merchant" do
    merchant_1 = Merchant.create(name: "Gary's Goats", address: "4572 Bleat Boulevard", city: "New Haven", state: "CT", zip: 97345)
    merchant_2 = Merchant.create(name: "Doug's Donuts", address: "123 Fried Dough Drive", city: "Portland", state: "OR", zip: 12345)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_button("Delete")

    click_button "Delete"

    expect(current_path).to eq("/merchants")

    expect(page).to_not have_content("Gary's Goats")

    expect(page).to have_content("Doug's Donuts")
  end
end
