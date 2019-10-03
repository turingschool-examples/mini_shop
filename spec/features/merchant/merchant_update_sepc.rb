require 'rails_helper'

describe 'As a Visitor' do
  describe 'Clicking on the Edit link' do
    it 'Can bring a form that will update the merchant' do
      merchant_1 = Merchant.create(
        name: 'Costco',
        address: '123 Main st',
        city: 'Lakewood',
        state: 'CO',
        zip: '80127'
      )
      visit "/merchants/#{merchant_1.id}"
      expect(page).to have_link('Edit')
      click_link('Edit')
      save_and_open_page
      expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")
      fill_in 'name', with: 'Sams Club'
      fill_in 'address', with: '321 Niam ts'
      fill_in 'city', with: 'Doowekal'
      fill_in 'state', with: 'OC'
      fill_in 'zip', with: '72108'
      click_button('update')
      expect(current_path).to eq("/merchants/#{merchant_1.id}")
      expect(page).to have_content('Sams Club')
      expect(page).to have_content('321 Niam ts')
      expect(page).to have_content('Doowekal')
      expect(page).to have_content('OC')
      expect(page).to have_content('72108')
      expect(page).to_not have_content('Costco')
    end
  end
end
