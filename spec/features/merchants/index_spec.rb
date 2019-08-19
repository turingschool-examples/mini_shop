require "rails_helper"

RSpec.describe "merchants index page", type: :feature do
  it "user can see all merchants" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)

    visit "/merchants"

    expect(page).to have_link("Merchants")
    expect(page).to have_link("Items")
    expect(page).to have_link(merchant_1.name)
    expect(page).to have_link(merchant_2.name)

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
