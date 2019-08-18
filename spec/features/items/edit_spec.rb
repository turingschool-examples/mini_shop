require 'rails_helper'

RSpec.describe "Item Show page" do
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

  it "should show a link to update a given item" do
    visit "/items/#{@item_1.id}"

    expect(page).to have_link("Update Item")

    click_on "Update Item"

    expect(current_path).to eq("/items/#{@item_1.id}/edit")

    item_update = {
      name: "Bananas",
      price: 3.99,
      description: "Sourced from Costa Rica, Honduras, Guatemala, Colombia, Ecuador, Peru or Nicaragua",
      image: "https://images.costcobusinessdelivery.com/ImageDelivery/imageService?profileId=12028466&itemId=30669&recipeName=680",
      inventory: 200
    }

    fill_in :name, with: item_update[:name]
    fill_in :price, with: item_update[:price]
    fill_in :description, with: item_update[:description]
    fill_in :image, with: item_update[:image]
    fill_in :inventory, with: item_update[:inventory]

    click_on "Update Item"

    expect(current_path).to eq("/items/#{@item_1.id}")

    expect(page).to have_content(item_update[:name])
    expect(page).to have_content(item_update[:price])
    expect(page).to have_content(item_update[:description])
    expect(page).to have_css("img[src*='#{item_update[:image]}']")
    expect(page).to have_content(item_update[:inventory])
  end
end
