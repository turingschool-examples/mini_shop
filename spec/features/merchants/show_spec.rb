require 'rails_helper'

RSpec.describe 'merchants show page', type: :feature do
  describe 'when a user visits a merchant page' do
    it 'user can see merchant details' do
      merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')

      visit merchant_path(merchant)

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(merchant.address)
      expect(page).to have_content(merchant.city)
      expect(page).to have_content(merchant.state)
      expect(page).to have_content(merchant.zip)
    end

    it 'user can see edit link' do
      merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')

      visit merchant_path(merchant)

      expect(page).to have_link("Edit")
    end
  end
end
