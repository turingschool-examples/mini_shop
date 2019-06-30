require 'rails_helper'

RSpec.describe "items index page", type: :feature do
  describe "As a Visitor" do
    it "When I visit '/items' I see each item in the system including it's attributes" do

      merchant_1 = Merchant.create(name: "Lost Outpost", address: "Lost", city: "Beekman", state: "LA", zip: 71220)

      item_1 = Item.create(name: "Tomahawk", description: "A hardened, high-carbon steel head makes this Tomahawk a great camp tool. The handle is hickory and 19 inches in length. This Tomahawk has great heft and balance great for target practice or competition.", price: 19.99, image: "<image of tomahawk here>", status: "IN STOCK", inventory: 3)

      visit "/items"

      expect(page).to have_content("Name: #{item_1.name}")
      expect(page).to have_content("Description: #{item_1.description}")
      expect(page).to have_content("Price: #{item_1.price}")
      expect(page).to have_content("Image: #{item_1.image}")
      expect(page).to have_content("Status: #{item_1.status}")
      expect(page).to have_content("Inventory: #{item_1.inventory}")
      expect(page).to have_content("Merchant Name: #{merchant_1.name}")
    end
  end
end
