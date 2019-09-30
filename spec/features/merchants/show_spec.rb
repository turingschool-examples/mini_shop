require 'rails_helper'

describe 'Merchant show Page' do
  describe 'As a User' do
    before :each do
      @candy_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
    end

    it 'I see the merchant with that id including the merchant stats' do
      visit merchant_path(@candy_store)

      expect(page).to have_content(@candy_store.name)
      expect(page).to have_content(@candy_store.address)
      expect(page).to have_content(@candy_store.city)
      expect(page).to have_content(@candy_store.state)
      expect(page).to have_content(@candy_store.zip)
    end
  end
end
