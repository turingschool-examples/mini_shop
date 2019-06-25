require 'rails_helper'

RSpec.describe 'merchants index page', type: :feature do
  describe 'when a user visits the index page' do
    it 'user can see all merchants' do
      merchant_1 = Merchant.create(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      merchant_2 = Merchant.create(name: 'Roy', address: '601 W 11th', city: 'Chicago', state: 'IL', zip: '50291')

      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end
end
