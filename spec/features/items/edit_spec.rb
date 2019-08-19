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

RSpec.describe 'Item Update', type: :feature do
  describe 'When I visit Item Show page' do
    it 'can click a link to update that item' do
      ulta = Merchant.create(name: 'Ulta', address: '1150 S Ironton', city: 'Aurora', state: 'CO', zip: 80012)
      chocolate_gold = ulta.items.create(name: 'Eyeshadow Palette', description: 'Too Faced Chocolate Gold 99 g Eyeshadow Palette', price: 55, image: 'https://rukminim1.flixcart.com/image/704/704/jcqjr0w0/eye-shadow/6/v/y/99-chocolate-gold-too-faced-original-imaffsucfzhtkzzv.jpeg?q=70', status: true, inventory: 20)

      visit "/items/#{chocolate_gold.id}"

      click_link 'Edit'

      expect(current_path).to eq("/items/#{chocolate_gold.id}/edit")

      fill_in 'Name', with: 'Too Faced Eyeshadow Palette'
      fill_in 'Price', with: 42
      fill_in 'Description', with: 'Chocolate Gold 99 g Eyeshadow Palette'
      fill_in 'inventory', with: 30
      click_on 'Update Item'

      expect(current_path).to eq("/items/#{chocolate_gold.id}")
      expect(page).to have_content('Too Faced')
      expect(page).not_to have_content(55)
      expect(page).not_to have_content(20)

    end
  end
end
