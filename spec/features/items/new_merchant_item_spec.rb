require 'rails_helper'

RSpec.describe 'New Merchant Item' do
  describe 'As a visitor' do
    describe 'When I visit the Merchant Items Index page' do
      it 'I see a link to add a new item for that merchant' do

        merchant_1 = Merchant.create!(name: "Lost Outpost", address: "Lost", city: "Beekman", state: "LA", zip: 71220)

        name = 'Lost Outpost Logo Cattle Brand'
        price = 49.99
        description = 'Hand forged Cast iron brand with wood handle. Axe in log logo designed by Robert Thomas. Total length: 2 1/2 feet long.'
        image = '<item image here>'
        status = 'active'
        inventory = 15


        visit "/merchants/#{merchant_1.id}/items"

        click_link 'Add New Item'

        expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")

        fill_in 'item[name]', with: name
        fill_in 'item[price]', with: 49.99
        fill_in 'item[description]', with: description
        fill_in 'item[image]', with: image
        fill_in 'item[status]', with: status
        fill_in 'item[inventory]', with: inventory

        click_on 'Create Item'

        expect(current_path).to eq("/merchants/#{merchant_1.id}/items")

        new_item = Item.last

        expect(current_path).to eq("/merchants/#{new_item.merchant.id}/items")

        expect(page).to have_content('Item: Lost Outpost Logo Cattle Brand')
        expect(page).to have_content('Status: active')
        expect(page).to have_content('Price: 49.99')
        expect(page).to have_content('Description: Hand forged Cast iron brand with wood handle. Axe in log logo designed by Robert Thomas. Total length: 2 1/2 feet long.')
        expect(page).to have_content('<item image here>')
        expect(page).to have_content('Inventory: 15')
      end
    end
  end
end
