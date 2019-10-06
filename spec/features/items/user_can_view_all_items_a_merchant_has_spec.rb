# As a visitor
# When I visit '/merchants/:merchant_id/items'
# Then I see each Item that belongs to the Merchant with that merchant_id including the Item's:
# - name
# - price
# - image
# - active/inactive status
# - inventory

require 'rails_helper'

RSpec.describe "Merchant Items Index" do
  describe "As a visitor" do
    describe "When I visit /merchants/:merchant_id/items" do
      it "can see each item belonging to a merchant and their attributes" do
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
          zip: "55555")

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

        visit "/merchants/#{merchant_1.id}/items"


        expect(page).to have_content("REI")
        expect(page).to have_content(item_1.name)
        expect(page).to have_content(item_1.price)
        expect(page).to have_content(item_1.image)
        expect(page).to have_content(item_1.active)
        expect(page).to have_content(item_1.inventory)

        expect(page).to have_content(item_2.name)
        expect(page).to have_content(item_2.price)
        expect(page).to have_content(item_2.image)
        expect(page).to have_content(item_2.active)
        expect(page).to have_content(item_2.inventory)
      end
    end
  end
end

