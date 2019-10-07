# As a visitor
# When I visit '/items/:id'
# Then I see the item with that id including the item's:
# - name
# - active/inactive status
# - price
# - description
# - image
# - inventory
# - the name of the merchant that sells the item

require 'rails_helper'

RSpec.describe "Show item" do
  describe "When I visit /items/:id" do
    it "can see the item with that id and it's attributes" do
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

      visit "/items/#{item_1.id}"

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.price)
      # expect(page).to have_content(item_1.image)
      expect(page).to have_content(item_1.active)
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content("REI")
    end
  end
end