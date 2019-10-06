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
      merchant_2 = Merchant.create(name: "Moosejaw",
        address: "4321 Bob Street",
        city: "Denver",
        state: "Colorado",
        zip: "55555"
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
      item_2 = Item.create(
        name: "Boots",
        description: "They're boots",
        price: 42,
        image: 'https://images.app.goo.gl/fscn8iVUD56gpZraA',
        active: true,
        inventory: 400,
        merchant_id: merchant_1.id
      )
      item_3 = Item.create(
        name: "Shoe",
        description: "Just one show",
        price: 5000,
        image: 'https://images.app.goo.gl/fscn8iVUD56gpZraA',
        active: false,
        inventory: 3,
        merchant_id: merchant_2.id
      )
      visit '/merchants'
      binding.pry
      page.first(:link, "REI").click
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit "/items"
      page.first(:link, "REI").click
      expect(current_path).to eq("/merchants/#{merchant_1.id}")

      visit "/items/#{item_1.id}"
      page.first(:link, "REI").click
      expect(current_path).to eq("/merchants/#{merchant_1.id}")
    end
  end
end
