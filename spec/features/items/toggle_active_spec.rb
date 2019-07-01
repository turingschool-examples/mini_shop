require 'rails_helper'

RSpec.describe 'Items Show page', type: :feature do
  describe 'when a user visits an item page' do
    it 'user can see item details' do
      merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      item = merchant.items.create!(name: 'iPhone', description: 'A phone', price: 999.99, image: 'iphone.jpg', active: true, inventory: 1000)

      visit item_path(item)

      within('.title') { expect(page).to have_content(item.name) }
      within('#description') { expect(page).to have_content(item.description) }
      within('#active') { expect(page).to have_content(true) }
      within('.nav-2') { expect(page).to have_button("Deactivate") }
      within('.nav-2') { expect(page).to_not have_button("Activate") }

      click_button "Deactivate"

      within('.title') { expect(page).to have_content(item.name) }
      within('#description') { expect(page).to have_content(item.description) }
      within('#active') { expect(page).to have_content(false) }
      within('.nav-2') { expect(page).to have_button("Activate") }
      within('.nav-2') { expect(page).to_not have_button("Deactivate") }

      click_button "Activate"

      within('.title') { expect(page).to have_content(item.name) }
      within('#description') { expect(page).to have_content(item.description) }
      within('#active') { expect(page).to have_content(true) }
      within('.nav-2') { expect(page).to have_button("Deactivate") }
      within('.nav-2') { expect(page).to_not have_button("Activate") }
    end
  end
end
