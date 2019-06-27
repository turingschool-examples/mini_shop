require "rails_helper"

RSpec.describe "Merchant items create page", type: :feature do
  it "user can create new merchant's items" do


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
    # item_5 = Items.create(name: "Sunglass is", description: "You can't see at night.",
    #   price: 14.99, image_url: "last lengthy link", status: 0, inventory: 5)


    visit "/merchants/#{item_1.merchant_id}/items"

    click_on "Add new Item for this Merchant"

    expect(current_path).to eq("/merchants/#{item_1.merchant_id}/items/new")

    fill_in 'Name', with: 'Sunglass is'
    fill_in 'Description', with: "You can't see at night."
    fill_in 'Price', with: "14.99"
    fill_in 'Image', with: 'last lengthy link'
    fill_in 'Inventory', with: '5'

    click_on "Create Item"

    expect(current_path).to eq("/merchants/#{item_1.merchant_id}/items")


    expect(page).to have_content('Sunglass is')
    expect(page).to have_content("You can't see at night.")
    expect(page).to have_content("14.99")
    expect(page).to have_content('last lengthy link')
    expect(page).to have_content('5')



  end
end










# User Story 9, Merchant Item Creation
#
# As a visitor
# When I visit a Merchant Items Index page
# Then I see a link to add a new item for that merchant
# When I click the link
# I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item
# When I fill in the form with the item's:
# - name
# - price
# - description
# - image
# - inventory
# Then a `POST` request is sent to '/merchants/:merchant_id/items',
# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page where I see the new item
