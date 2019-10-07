require 'rails_helper'

describe "merchants index page", type: :feature do
  it "can see all merchants" do
    merchant_1 = Merchant.create(
      name: "Hills Shop",
      address: "not cool place",
      city: "denver",
      state: "colorado",
      zip: "80210"
    )
    merchant_2 = Merchant.create(
      name: "Johns Shop",
      address: "cool place",
      city: "denver",
      state: "colorado",
      zip: "80210"
    )

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
