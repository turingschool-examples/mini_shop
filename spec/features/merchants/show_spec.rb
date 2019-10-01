require 'rails_helper'

describe 'Merchant show Page' do
  describe 'As a User' do
    before :each do
      @candy_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
    end

    it 'I see the merchant stats by their id' do
      visit merchant_path(@candy_store)

      expect(page).to have_content(@candy_store.name)
      expect(page).to have_content(@candy_store.address)
      expect(page).to have_content(@candy_store.city)
      expect(page).to have_content(@candy_store.state)
      expect(page).to have_content(@candy_store.zip)
    end

    it 'I see a link to update the merchant' do
      visit merchant_path(@candy_store)

      click_link 'Edit Merchant'

      expect(current_path).to eq("/merchants/#{@candy_store.id}/edit")

      address = '821 Park Place'
      city = 'Golden'

      fill_in 'Address', with: address
      fill_in 'City', with: city
      click_button 'Update Merchant'

      expect(current_path).to eq("/merchants/#{@candy_store.id}")

      expect(page).to have_content('821 Park Place')
      expect(page).to have_content('Golden')
    end

    it 'I see a link to delete the merchant' do
      visit merchant_path(@candy_store)

      click_link 'Delete Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(@candy_store.name)
    end
  end
end
