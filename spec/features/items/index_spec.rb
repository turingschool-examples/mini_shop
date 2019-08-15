require "rails_helper"

RSpec.describe "items index page", type: :feature do
  it "user can see all items" do
    item_1 = Item.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "ripe_pineapple.jpg", status: "Active", inventory: 1)
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
