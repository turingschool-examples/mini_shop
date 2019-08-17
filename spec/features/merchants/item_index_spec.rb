require 'rails_helper'

RSpec.describe "Merchant Items Index Page", type: :feature do
  it "should show a list of all items that belong to a given merchant" do
    merchant_1 = Merchant.create!(name: "Iris Watson", address: "8562 Fusce Rd.", city: "Frederick", state: "NB", zip: 20620)

    item_1 = merchant_1.items.create!(
      name: "Rainier Cherries",
      description: "Rainier Cherries, 2 lbs",
      price: 15.99,
      image: "https://images.costcobusinessdelivery.com/ImageDelivery/imageService?profileId=12028466&itemId=53747&recipeName=680",
      status: TRUE,
      inventory: 200
    )

    item_2 = merchant_1.items.create!(
      name: "Nectarines",
      description: "White Flesh Premium Nectarines, 5 lbs",
      price: 9.99,
      image: "https://d1fywv0iz2cv2w.cloudfront.net/pimage/2925a20c743423a12f1be4f348f0013f.jpeg",
      status: FALSE,
      inventory: 500
    )

    visit "/merchants/#{merchant_1.id}/items"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='#{item_1.image}']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img[src*='#{item_2.image}']")
    expect(page).to have_content(item_2.status)
    expect(page).to have_content(item_2.inventory)
  end
end
