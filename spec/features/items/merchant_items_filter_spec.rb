require 'rails_helper'

RSpec.describe 'Merchant Items page', type: :feature do
  describe 'when a user visits merchants/:id/items' do
    before(:each) do
    end

    it 'user can see all items belonging to that merchant' do
      merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      item_1 = merchant.items.create!(name: 'iPhone', description: 'A phone', price: 999.99, image: 'iphone.jpg', active: true, inventory: 1000)
      item_2 = merchant.items.create!(name: 'Snuggie', description: 'Not a blanket', price: 4.99, image: 'iphone.jpg', active: true, inventory: 7)
      item_3 = merchant.items.create!(name: 'Zebra', description: 'Not a horse', price: 5000, image: 'iphone.jpg', active: false, inventory: 1)

      visit merchant_items_path(merchant)

      within(".item-list") do
        expect(page).to have_link(item_1.name)
        expect(page).to have_link(item_2.name)
        expect(page).to have_content(item_3.name)
        expect(page).to have_content(item_1.description)
        expect(page).to have_content(item_2.description)
        expect(page).to have_content(item_3.description)
      end

      click_button "Active Items"

      within(".item-list") do
        expect(page).to have_link(item_1.name)
        expect(page).to have_link(item_2.name)
        expect(page).to_not have_content(item_3.name)
        expect(page).to have_content(item_1.description)
        expect(page).to have_content(item_2.description)
        expect(page).to_not have_content(item_3.description)
      end

      click_button "Inactive Items"

      within(".item-list") do
        expect(page).to_not have_link(item_1.name)
        expect(page).to_not have_link(item_2.name)
        expect(page).to have_content(item_3.name)
        expect(page).to_not have_content(item_1.description)
        expect(page).to_not have_content(item_2.description)
        expect(page).to have_content(item_3.description)
      end

      click_button "All Items"

      within(".item-list") do
        expect(page).to have_link(item_1.name)
        expect(page).to have_link(item_2.name)
        expect(page).to have_content(item_3.name)
        expect(page).to have_content(item_1.description)
        expect(page).to have_content(item_2.description)
        expect(page).to have_content(item_3.description)
      end
    end
  end
end
