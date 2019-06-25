require "rails_helper"

RSpec.describe "merchants index page", type: :feature do
  it "user can see all merchants" do
    merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
      state: "Illinois", zip: 78047)
    merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
      state: "Hawaii", zip: 11111)
    merch_3 = Merchant.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
      state: "Colorado", zip: 80204)
    merch_4 = Merchant.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
      state: "New York", zip: 90876)

    visit "/merchants"

    expect(page).to have_content(merch_1.name)
    expect(page).to have_content(merch_2.name)
    expect(page).to have_content(merch_3.name)
    expect(page).to have_content(merch_4.name)
  end
end
