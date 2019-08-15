require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the merchants show page' do
    it 'I see a link to update a merchant' do
      merchant_1 = Merchant.create!(name: "Cecilia Chapman", address: "711-2880 Nulla St.", city: "Mankato", state: "MS", zip: 96522)

      visit "/merchants/#{merchant_1.id}"

      expect(page).to have_link("Edit")

      click_link 'Edit'

      expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

      fill_in :name, with: "Mark"
      fill_in :address, with: "4628 E 23rd Ave"
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: 80207

      click_button 'Update Merchant'
      
      expect(current_path).to eq("/merchants/#{merchant_1.id}")
      expect(page).to have_content("Mark")
      expect(page).to have_content("4628 E 23rd Ave")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content(80207)
    end
  end
end
