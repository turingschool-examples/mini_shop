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
    end
  end
end
