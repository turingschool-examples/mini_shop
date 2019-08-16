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

describe 'User visits item show page' do
  describe 'User clicks link to update item' do
    describe 'User fills in form and clicks submit' do
      it 'Updates the item information' do
        yum = Merchant.create( name: 'Yum Yum Snacks', address: '123 Tasty Town Ave', city: 'Denver', state: 'CO', zip: '80239')
        snack = yum.items.create( name: 'Chocolate Crunchy Taco Chips',
                          description: 'Crunchy corn chips with dark chocolate and chili powder!',
                          price: 3.79,
                          image: 'https://www.abdallahcandies.com/wp-content/uploads/2017/11/CHOC-COV-POTATO-CHIPS.png',
                          active: true,
                          inventory: 23)
        new_price = 4.29
        new_inventory = 50
        visit "/items/#{snack.id}"
        click_link 'Edit Item Info'

        expect(current_path).to eq("/items/#{snack.id}/edit")

        fill_in :price, with: new_price
        fill_in :inventory, with: new_inventory
        click_on 'Submit'

        expect(current_path).to eq("/items/#{snack.id}")
        expect(page).to have_content(snack.name)
        expect(page).to have_content(snack.description)
        expect(page).to have_content(snack.status)
        expect(page).to have_content(new_price)
        expect(page).to have_content(new_inventory)
      end
    end
  end
end
