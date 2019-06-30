require "rails_helper"

RSpec.describe "merchant items index"
  describe "When I visit the merchant items index" do
  it "Then I see each Item that belongs to the merchant with that merchant_id and the name, price, image,
  status and inventory" do

    merchant_1 = Merchant.create!(name: "Lost Outpost", address: "Lost", city: "Beekman", state: "LA", zip: 71220)

    item_1 = Item.create!(name: "Tomahawk", description: "A hardened, high-carbon steel head makes this Tomahawk a great camp tool. The handle is hickory and 19 inches in length. This Tomahawk has great heft and balance great for target practice or competition.", price: 19.99, image: "<image of tomahawk here>", status: "active", inventory: 3, merchant_id: merchant_1.id )

    visit "/merchants/#{merchant_1.id}/items"

    expect(page).to have_content("Merchant: #{merchant_1.name}")
    expect(page).to have_content("Item: #{item_1.name}")
    expect(page).to have_content("Price: #{item_1.price}")
    expect(page).to have_content(item_1.image)
    expect(page).to have_content("Status: #{item_1.status}")
    expect(page).to have_content("Inventory: #{item_1.inventory}")
  end
end
