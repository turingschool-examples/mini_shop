require 'rails_helper'

RSpec.describe "As a visitor on the Item Show page" do
  it "allows me to edit the item" do
    merchant_1 = Merchant.create( name: "Corner Store",
                                  address: "234 Yarp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80211")

    lightbulb = merchant_1.items.create( name: "Lightbulb",
                          description: "Let there be light",
                          price: 4.50,
                          image: '/assets/lightbulb.jpg',
                          status: 'active',
                          inventory: 12,
                        )


    visit "/items/#{lightbulb.id}"
    click_link "Update Item"

    expect(current_path).to eq("/items/#{lightbulb.id}/edit")

    fill_in "Name", with: "Safety Goggles"
    fill_in "Price", with: 4.7
    fill_in "Description", with: "Keep your eyeballs safe."
    fill_in "Image URL", with: "https://cdn.pixabay.com/photo/2015/07/28/17/10/safety-glasses-864648_1280.jpg"
    fill_in "Inventory", with: 100
    click_button "Submit"

    expect(current_path).to eq("/items/#{lightbulb.id}")
    expect(page).to have_content("Safety Goggles")
    expect(page).to_not have_content("Lightbulb")
  end
end

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
