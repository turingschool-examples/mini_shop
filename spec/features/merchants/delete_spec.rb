require 'rails_helper'

RSpec.describe 'merchants edit page', type: :feature do
  describe 'a user visits a merchant page' do
    it 'user clicks to delete the merchant' do
      merchant_1 = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      merchant_2 = Merchant.create!(name: 'Roy', address: '601 W 11th', city: 'Chicago', state: 'IL', zip: '50291')

      visit merchant_path(merchant_1)

      click_button "Delete"

      expect(current_path).to eq(merchants_path)

      expect(page).to_not have_content(merchant_1.name)
      within("#merchant-#{merchant_2.id}") do
        expect(page).to have_content(merchant_2.name)
      end
    end
  end
end
