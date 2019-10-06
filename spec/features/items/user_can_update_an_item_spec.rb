# As a visitor
# When I visit an Item Show page
# Then I see a link to update that Item
# When I click the link
# I am taken to '/items/:id/edit' where I see a form to edit the item's data including:
# - name
# - price
# - description
# - image
# - inventory
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/items/:id',
# the item's data is updated,
# and I am redirected to the Item Show page where I see the Item's updated information

require 'rails_helper'

RSpec.describe 'Update Item' do
  describe 'As a visitor' do
    describe 'When I visit the item show page' do
      describe "Then I see a link to update that item"
        describe "When I click the link"
      it "is taken '/items/:id/edit' where it can see a form to edit the item's data" do
        merchant_1 = Merchant.create(
          name: "Moosejaw",
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
        visit "/items/#{item_1.id}"

        click_button 'Edit'

        expect(current_path).to eq("/items/#{item_1.id}/edit")


        name = 'Boots'
        description = 'They are boots'
        price = 42
        image = 'https://images.app.goo.gl/fscn8iVUD56gpZraA'
        inventory = 400

        fill_in 'Name',        with: name
        fill_in 'Description', with: description
        fill_in 'Price',       with: price
        fill_in 'Image',       with: image
        fill_in 'Inventory',   with: inventory
        click_on 'Update Item'

        expect(current_path).to eq("/items/#{item_1.id}")
        expect(page).to have_content(name)
        expect(page).to have_content(description)
        expect(page).to have_content(price)
        expect(page).to have_content(image)
        expect(page).to have_content(inventory)
      end
    end
  end
end