require 'rails_helper'

RSpec.describe 'create merchant items' do
  describe 'as a visitor' do
    it 'creates a new item' do
      merchant = Merchant.create!(name:    'Oomba',
                                  address: '9840 Irvine Center Drive',
                                  city:    'Irvine',
                                  state:   'CA',
                                  zip:     92618)

      visit "/merchants/#{merchant.id}/items"

      click_link 'Add new item'

      expect(current_path).to eq("/merchants/#{merchant.id}/items/new")

      fill_in 'Name', with: 'Firefly squid'
      fill_in 'Price', with: 17.60
      fill_in 'Description', with: 'special organs emit a deep blue light that attracts small fish as prey'
      fill_in 'Image', with: 'https://upload.wikimedia.org/wikipedia/commons/7/77/Watasenia_scintillans.jpg'
      fill_in 'Inventory', with: 11

      click_button 'Add item'

      expect(current_path).to eq("/merchants/#{merchant.id}/items")

      expect(page).to have_content('Firefly squid')
      expect(page).to have_content(17.60)
      expect(page).to have_content('special organs emit a deep blue light that attracts small fish as prey')
      expect(page).to have_css("img[src='https://upload.wikimedia.org/wikipedia/commons/7/77/Watasenia_scintillans.jpg']")
      expect(page).to have_content('Active')
      expect(page).to have_content(11)
    end
  end
end

# As a visitor
# When I visit a Merchant Items Index page
# Then I see a link to add a new item for that merchant
# When I click the link
# I am taken to '/merchants/:merchant_id/items/new'
# where I see a form to add a new item
# When I fill in the form with the item's:
# - name
# - price
# - description
# - image
# - inventory
# Then a `POST` request is sent to '/merchants/:merchant_id/items',
# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page
# where I see the new item
