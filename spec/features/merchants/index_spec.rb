require 'rails_helper'

describe 'Merchant Index Page' do
  describe 'As a User' do
    before :each do
      @candy_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @food_store = Merchant.create(name: 'The Food Store', address: '123 Oak Street', city: 'Denver', state: 'CO', zip: 80_001)
    end

    it 'I see the name of each merchant in the system' do
      visit '/merchants'

      expect(page).to have_content(@candy_store.name)
      expect(page).to have_content(@food_store.name)
    end
  end
end
