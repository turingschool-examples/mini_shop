require 'rails_helper'

RSpec.describe 'merchants edit page', type: :feature do
  describe 'when a user visits a merchant page' do
    it 'user clicks to edit the merchant details' do
      merchant = Merchant.create!(name: 'Jon', address: '200 E 10th', city: 'Denver', state: 'CO', zip: '80204')

      visit merchant_path(merchant)

      click_link "Edit"

      expect(current_path).to eq(edit_merchant_path(merchant))
      expect(page).to have_content("Edit Merchant")
      expect(find_field(:name).value).to eq(merchant.name)
      expect(find_field(:address).value).to eq(merchant.address)
      expect(find_field(:city).value).to eq(merchant.city)
      expect(find_field(:state).value).to eq(merchant.state)
      expect(find_field(:zip).value).to eq(merchant.zip)

      fill_in "name", with: "Jonathan"
      fill_in "zip", with: "80222"
      click_on "Submit"

      expect(current_path).to eq(merchant_path(merchant))
      expect(page).to have_content("Jonathan")
      expect(page).to have_content(merchant.address)
      expect(page).to have_content(merchant.city)
      expect(page).to have_content(merchant.state)
      expect(page).to have_content("80222")
    end
  end
end
