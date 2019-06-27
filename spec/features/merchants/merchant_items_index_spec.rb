require "rails_helper"

RSpec.describe "Merchant items index page", type: :feature do
  it "user can see all merchant's items" do


    merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
      state: "Illinois", zip: 78047)
    merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
      state: "Hawaii", zip: 11111)
    merch_3 = Merchant.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
      state: "Colorado", zip: 80204)
    merch_4 = Merchant.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
      state: "New York", zip: 90876)

    item_1 = merch_1.items.create(name: "The Worlds Best Tooth Brush", description: "It's just a normal toothbrush.",
      price: 1.99, image_url: "first lengthy link", status: 0, inventory: 6)
    item_2 = merch_2.items.create(name: "The worlds worst ear Brush", description: "A brush for your ear made of gold.",
      price: 199.99, image_url: "second lengthy link", status: 1, inventory: 1)
    item_3 = merch_3.items.create(name: "A real fake mustache!", description: "An actual fake mustache.",
      price: 0.99 ,  image_url: "third lengthy link", status: 0, inventory: 689)
    item_4 = merch_4.items.create(name: "Air holding Box", description: "Our lightest box yet.",
      price: 3.99, image_url: "fourth lengthy link", status: 0, inventory: 0)
    item_5 = merch_1.items.create(name: "Sunglass is", description: "You can't see at night.",
      price: 14.99, image_url: "last lengthy link", status: 0, inventory: 5)


    visit "/merchants/#{item_1.merchant_id}/items"


    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_5.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_5.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_5.price)
    expect(page).to have_content(item_1.image_url)
    expect(page).to have_content(item_5.image_url)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_5.inventory)


  end
end











# User Story 7, Merchant Items Index
#
# As a visitor
# When I visit '/merchants/:merchant_id/items'
# Then I see each Item that belongs to the Merchant with that merchant_id including the Item's:
# - name
# - price
# - image
# - active/inactive status
# - inventory
