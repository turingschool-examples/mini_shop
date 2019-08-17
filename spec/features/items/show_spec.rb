require 'rails_helper'

RSpec.describe "item show page" do
  it "" do
    merchant_1 = Merchant.create!(name: "Iris Watson", address: "8562 Fusce Rd.", city: "Frederick", state: "NB", zip: 20620)
    item_1 = merchant_1.items.create(
      name: "Rainier Cherries",
      description: "Rainier Cherries, 2 lbs",
      price: 15.99,
      image: "https://images.costcobusinessdelivery.com/ImageDelivery/imageService?profileId=12028466&itemId=53747&recipeName=680",
      status: TRUE,
      inventory: 200,
      merchant_id: merchant_1.id
    )
    visit "/items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_1.description)
    expect(page).to have_css("img[src*='#{item_1.image}']")
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_1.merchant.name)
  end
end
