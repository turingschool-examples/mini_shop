# As a visitor
# When I visit '/items'
# Then I see each Item in the system including the Item's:
# - name
# - description
# - price
# - image
# - active/inactive status
# - inventory
# - the name of the merchant that sells the item

require 'rails_helper'

RSpec.describe "Item Index" do
  describe "As a visitor" do
    describe "When I visit /items" do
      it "can see each item and their attributes" do
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
        item_2 = Item.create(
          name: "Boots",
          description: "They're boots",
          price: 42,
          image: 'https://images.app.goo.gl/fscn8iVUD56gpZraA',
          active: true,
          inventory: 400,
          merchant_id: merchant_1.id
        )

        visit '/items'

        expect(page).to have_content(item_1.name)
        expect(page).to have_content(item_1.description)
        expect(page).to have_content(item_1.price)
        expect(page).to have_content(item_1.image)
        expect(page).to have_content(item_1.active)
        expect(page).to have_content(item_1.inventory)
        expect(page).to have_content("REI")

        expect(page).to have_content(item_2.name)
        expect(page).to have_content(item_2.description)
        expect(page).to have_content(item_2.price)
        expect(page).to have_content(item_2.image)
        expect(page).to have_content(item_2.active)
        expect(page).to have_content(item_2.inventory)
        expect(page).to have_content("REI")
      end
    end
  end
end

