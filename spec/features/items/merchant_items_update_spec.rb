require "rails_helper"

RSpec.describe "Merchant items update page", type: :feature do
  it "user can update and change merchant's items" do


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
      #price: 14.99, image_url: "last lengthy link", status: 0, inventory: 5)


    visit "/items/#{item_1.id}"

    click_link "Update Item"

    expect(current_path).to eq("/items/#{item_1.id}/edit")

    fill_in 'Name', with: 'Sunglass is'
    fill_in 'Description', with: "You can't see at night."
    fill_in 'Price', with: "14.99"
    fill_in 'Image', with: 'last lengthy link'
    fill_in 'Inventory', with: '5'

    click_on "Update Item"

    expect(current_path).to eq("/items/#{item_1.id}")


    expect(page).to have_content('Sunglass is')
    expect(page).to have_content("You can't see at night.")
    expect(page).to have_content("14.99")
    expect(page).to have_content('last lengthy link')
    expect(page).to have_content('5')



  end
end



# User Story 10, Item Update
#
# As a visitor
# When I visit an Item Show page
# Then I see a link to update that Item
# When I click the link
# I am taken to '/items/:id/edit' where I see a form to edit the item's data including:
# - name
# - price
# - description
# - image
# - inventory
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/items/:id',
# the item's data is updated,
# and I am redirected to the Item Show page where I see the Item's updated information
