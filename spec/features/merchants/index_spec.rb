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

    it 'I see a link to create a new merchant' do
      visit '/merchants'

      click_link 'Create Merchant'

      expect(current_path).to eq('/merchants/new')

      name = 'New Shop'
      address = '123 Orange Ave'
      city = 'Denver'
      state = 'Colorado'
      zip = '80021'

      fill_in 'Name', with: name
      fill_in 'Address', with: address
      fill_in 'City', with: city
      fill_in 'State', with: state
      fill_in 'Zip', with: zip
      click_button 'Create Merchant'

      expect(current_path).to eq('/merchants')

      new_shop = Merchant.last

      expect(page).to have_content(new_shop.name)
    end

    it 'Every merchant name is a link to that merchant show page' do
      visit '/merchants'
      click_link 'The Candy Store'
      expect(current_path).to eq("/merchants/#{@candy_store.id}")
    end
  end
end
