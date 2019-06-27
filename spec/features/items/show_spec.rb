require 'rails_helper'

RSpec.describe 'Items Show page', type: :feature do
  describe 'when a user visits an item page' do
    it 'user can see item details' do
      merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      item = merchant.items.create!(name: 'iPhone', description: 'A phone', price: 999.99, image: 'iphone.jpg', active: true, inventory: 1000)

      visit item_path(item)

      within('.title') { expect(page).to have_content(item.name) }
      within('#description') { expect(page).to have_content(item.description) }
      within('#price') { expect(page).to have_content(item.price) }
      within('#image') { expect(page).to have_content(item.image) }
      within('#active') { expect(page).to have_content(item.active) }
      within('#inventory') { expect(page).to have_content(item.inventory) }
      within('#merchant') { expect(page).to have_content(merchant.name) }
    end

    # it 'user can see links' do
    #   merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
    #   item = merchant.items.create!(name: 'iPhone', description: 'A phone', price: 999.99, image: 'iphone.jpg', active: true, inventory: 1000)
    #
    #   visit item_path(item)
    #
    #   within('.bottom_link') do
    #     expect(page).to have_link("Edit")
    #     expect(page).to have_link("Delete")
    #   end
    # end
  end
end
