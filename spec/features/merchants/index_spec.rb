require "rails_helper"

RSpec.describe "merchant index page", type: :feature do
  it "visit can see all merchants" do
    merchant_1 = Merchant.create(name: "Stuff n' Things", address: "123 North St", city: "Denver", zip: 80203)
    merchant_2 = Merchant.create(name: "The Widget Store", address: "456 East St", city: "Colorado Springs", zip: 80829)
    merchant_3 = Merchant.create(name: "All the Things", address: "789 South St", city: "Boulder", zip: 80301)

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)
  end
end

# t.string "name"
# t.string "address"
# t.string "city"
# t.integer "zip"
