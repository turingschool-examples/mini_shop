require "rails_helper"

RSpec.describe "Items index page", type: :feature do
  it "user can see all items" do

    
    merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
      state: "Illinois", zip: 78047)
    merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
      state: "Hawaii", zip: 11111)
    merch_3 = Merchant.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
      state: "Colorado", zip: 80204)
    merch_4 = Merchant.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
      state: "New York", zip: 90876)


    item_1 = Item.create(name: "The Worlds Best Tooth Brush", description: "123 Ya moms house Circle", price: 1.99,
      image_url: "first lengthy link", status: 0, inventory: 6, merchant_name: merch_1.name)
    item_2 = Item.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
      state: "Hawaii", zip: 11111)
    item_3 = Item.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
      state: "Colorado", zip: 80204)
    item_4 = Item.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
      state: "New York", zip: 90876)

    visit "/items"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_3.name)
    expect(page).to have_content(item_4.name)
  end
end
