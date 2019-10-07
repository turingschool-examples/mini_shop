require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "can see all merchant names" do
    merchant_1 = Merchant.create(name: "David's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")
    merchant_2 = Merchant.create(name: "Billy's shop",
                                  address: "5789 Lincoln St",
                                  city: "Arvada",
                                  state: "Colorado",
                                  zip: "87342")

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
