require 'rails_helper'

RSpec.describe "Item show page" do
  before(:each) do
      @merchant_1 = Merchant.create!(name: "Iris Watson", address: "8562 Fusce Rd.", city: "Frederick", state: "NB", zip: 20620)

      @item_1 = @merchant_1.items.create!(
        name: "Rainier Cherries",
        description: "Rainier Cherries, 2 lbs",
        price: 15.99,
        image: "https://images.costcobusinessdelivery.com/ImageDelivery/imageService?profileId=12028466&itemId=53747&recipeName=680",
        status: TRUE,
        inventory: 200
      )
  end

  it "should show a link to delete the item" do
    visit "/items/#{@item_1.id}"

    expect(page).to have_link("Delete Item")

    click_on "Delete Item"

    expect(current_path).to eq("/items")
    expect(page).to_not have_css("#item-#{@item_1.id}")
  end
end


# User Story 12, Item Delete
#
# As a visitor
# When I visit an item show page
# Then I see a link to delete the item
# When I click the link
# Then a 'DELETE' request is sent to '/items/:id',
# the item is deleted,
# and I am redirected to the item index page where I no longer see this item
