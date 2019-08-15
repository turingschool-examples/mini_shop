require "rails_helper"

describe "items index page" do
  it "visitor can see all items" do
    item_1 = Item.create(
      name: "Blueberries",
      description: "Kirkland Signature Whole Dried Blueberries",
      price: 10.99,
      image: "https://d1fywv0iz2cv2w.cloudfront.net/product-image/v201610/cff2fff29dfb318dd3c5fdc2eea96810.jpeg",
      status: TRUE,
      inventory: 1000,
      merchant: "Kirkland"
      )

    visit "/items"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='#{item_1.image}']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_1.merchant)
  end
end
