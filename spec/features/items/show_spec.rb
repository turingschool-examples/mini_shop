require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit an item show page ('/items/:id')" do
    it "then I see only that items's attributes" do

      merchant_1 = Merchant.create!(name: "Lost Outpost", address: "Lost", city: "Beekman", state: "LA", zip: 71220)

      item_1 = Item.create!(name: "Tomahawk", description: "A hardened, high-carbon steel head makes this Tomahawk a great camp tool. The handle is hickory and 19 inches in length. This Tomahawk has great heft and balance great for target practice or competition.", price: 19.99, image: "<image of tomahawk here>", status: "active", inventory: 3, merchant_id: merchant_1.id )

      visit "/items/#{item_1.id}"

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.status)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.image)
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content(item_1.merchant.name)
    end
  end
end
