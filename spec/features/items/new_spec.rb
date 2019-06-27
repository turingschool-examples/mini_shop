require 'rails_helper'

RSpec.describe 'Items new entry', type: :feature do
  describe 'when a user visits a merchant items index page' do
    it 'user clicks to create a new item' do
      merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')

      visit merchant_items_path(merchant)
      click_link "New Item"

      expect(current_path).to eq(new_item_path(merchant))
      within('.title') { expect(page).to have_content("New Item") }

      fill_in "name", with: "iPhone"
      fill_in "description", with: "A phone"
      fill_in "price", with: 999.99
      fill_in "image", with: "iphone.jpg"
      fill_in "active", with: true
      fill_in "inventory", with: 1000
      click_on "Submit"

      expect(current_path).to eq(merchant_items_path(merchant))
      within('.title') { expect(page).to have_content("All Items for #{merchant.name}") }
      within("#item-#{Item.last.id}") do
        expect(page).to have_content("iPhone")
        expect(page).to have_content("A phone")
        expect(page).to have_content(999.99)
        expect(page).to have_content("iphone.jpg")
        expect(page).to have_content(true)
        expect(page).to have_content(1000)
      end
    end
  end
end
