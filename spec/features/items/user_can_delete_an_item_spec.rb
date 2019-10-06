# As a visitor
# When I visit an item show page
# Then I see a link to delete the item
# When I click the link
# Then a 'DELETE' request is sent to '/items/:id',
# the item is deleted,
# and I am redirected to the item index page where I no longer see this item

require 'rails_helper'

RSpec.describe 'As a Visitor' do
  describe 'When I visit an item show page' do
    describe "Then I can see a link to delete the item" do
      describe "When I click the link" do
        it "deletes the item and redirect to item index page" do
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

          click_button 'Delete'

          expect(current_path).to eq('/items')
          expect(page).to_not have_content(merchant_1.name)
          expect(page).to_not have_content(item_1.name)
          expect(page).to_not have_content(item_1.description)
          expect(page).to_not have_content(item_1.price)
          expect(page).to_not have_content(item_1.image)
          expect(page).to_not have_content(item_1.inventory)
        end
      end
    end
  end
end