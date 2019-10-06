# As a visitor
# When I click on the name a merchant anywhere on the site
# Then that link takes me to that Merchant's show page

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I click on the name of a merchant anywhere on the site" do
    it "takes me to that Merchant's show page" do
      merchant_1 = Merchant.create(
        name: "REI",
        address: "1234 Smith Street",
        city: "Boulder",
        state: "Colorado",
        zip: "80303"
      )
      item_1 = Item.create(
        name: "Beanie",
        description: "It's a hat",
        price: 50,
        image: 'https://images.app.goo.gl/iDdDGM1vEZpUBY4M6',
        active: true,
        inventory: 50,
        merchant_id: merchant_1.id
      )
      visit '/merchants'
      page.first(:link, "REI").click
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit "/items"
      page.first(:link, "REI").click
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit "/items/#{item_1.id}"
      page.first(:link, "REI").click
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit "/merchants/#{merchant_1.id}/items"
      page.first(:link, "REI").click
      expect(current_path).to eq("/merchants/#{merchant_1.id}")
    end
  end
end
