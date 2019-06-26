require 'rails_helper'

RSpec.describe 'merchants edit page', type: :feature do
  describe 'when a user visits a merchant page' do
    it 'user clicks to edit the merchant details' do
      merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')

      visit merchant_path(merchant)

      click_link "Edit"

      expect(current_path).to eq(edit_merchants_path(merchant))
      expect(page).to have_content(merchant.name)
      expect(page).to have_content(merchant.address)
      expect(page).to have_content(merchant.city)
      expect(page).to have_content(merchant.state)
      expect(page).to have_content(merchant.zip)

      fill_in "name", with: "Jonathan"
      fill_in "address", with: "200 E 10th"
      fill_in "city", with: "Denver"
      fill_in "state", with: "CO"
      fill_in "zip", with: "80222"
      click_on "Submit"

      expect(current_path).to eq(merchant_path(merchant))
      expect(page).to have_content("All Merchants")
      expect(page).to have_content("Jonathan")
      expect(page).to have_content(merchant.address)
      expect(page).to have_content(merchant.city)
      expect(page).to have_content(merchant.state)
      expect(page).to have_content("80222")
    end
  end
end
