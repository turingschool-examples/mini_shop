# As a visitor
# When I visit a Merchant Items Index page
# Then I see a link to add a new item for that merchant
# When I click the link
# I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item
# When I fill in the form with the item's:
# - name
# - price
# - description
# - image
# - inventory
# Then a `POST` request is sent to '/merchants/:merchant_id/items',
# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page where I see the new item

require 'rails_helper'

RSpec.describe "Merchant Item Creation" do
  describe "When I visit a Merchant Items Index page" do 
    describe "Then I see a link to add a new item for that merchant" do
      describe "When I click the link" do
        it "is taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item" do
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
          name = "Boots"
          description = "They're boots"
          price = 42
          image = 'https://images.app.goo.gl/fscn8iVUD56gpZraA'
          active = true
          inventory = 400

          visit "/merchants/#{merchant_1.id}/items"

          click_button 'New Item'

          expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")

          fill_in 'Name',        with: 'Boots'
          fill_in 'Description', with: "They're boots"
          fill_in 'Price',       with: 42
          fill_in 'Image',       with: 'https://images.app.goo.gl/fscn8iVUD56gpZraA'
          fill_in 'inventory',   with: 400
          click_on 'Create Item'

          expect(current_path).to eq("/merchants/#{merchant_1.id}/items")

          expect(page).to have_content("REI")
          expect(page).to have_content(item_1.name)
          expect(page).to have_content(item_1.price)
          expect(page).to have_content(item_1.image)
          expect(page).to have_content(item_1.active)
          expect(page).to have_content(item_1.inventory)

          expect(page).to have_content(name)
          expect(page).to have_content(price)
          expect(page).to have_content(image)
          expect(page).to have_content(active)
          expect(page).to have_content(inventory)
        end
      end
    end
  end
end