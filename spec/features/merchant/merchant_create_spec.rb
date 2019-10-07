require 'rails_helper'

describe 'As a visitor' do
  describe 'Can click on create link' do
    it 'can go to new page' do
      visit '/merchants'
      expect(page).to have_link('New Merchant')
      click_link('New Merchant')
      expect(current_path).to eq("/merchants/new")
      fill_in 'name', with: 'Costco'
      fill_in 'address', with: '567 Main St'
      fill_in 'city', with: 'Littleton'
      fill_in 'state', with: 'CO'
      fill_in 'zip', with: '80129'
      click_button('create')
      expect(current_path).to eq("/merchants")
      expect(page).to have_content('Costco')
      expect(page).to_not have_content('Best Buy')
      expect(Merchant.last.name).to eq('Costco')
      expect(Merchant.last.address).to eq('567 Main St')
      expect(Merchant.last.city).to eq('Littleton')
      expect(Merchant.last.state).to eq('CO')
      expect(Merchant.last.zip).to eq('80129')
    end
  end
end
