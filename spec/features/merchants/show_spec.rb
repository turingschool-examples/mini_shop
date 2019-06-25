require 'rails_helper'

RSpec.describe 'merchants show page', type: :feature do
  describe 'when a user visits a merchant page' do
    it 'user can see merchant details' do
      merchant_1 = Merchant.create(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')

      visit merchants_path(merchant_1)

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_1.address)
      expect(page).to have_content(merchant_1.city)
      expect(page).to have_content(merchant_1.state)
      expect(page).to have_content(merchant_1.zip)
    end
  end
end
