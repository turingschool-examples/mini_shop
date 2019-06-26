require 'rails_helper'

RSpec.describe 'merchants new entry', type: :feature do
  describe 'when a user visits the index page' do
    it 'user clicks to create a new merchant' do
      visit merchants_path
      click_link "New Merchant"

      expect(current_path).to eq(new_merchant_path)

      fill_in "name", with: "Jon"
      fill_in "address", with: "200 E 10th"
      fill_in "city", with: "Denver"
      fill_in "state", with: "CO"
      fill_in "zip", with: "80211"
      click_on "Submit"

      expect(current_path).to eq(merchants_path)
      expect(page).to have_content("All Merchants")
      expect(page).to have_content("Jon")
    end
  end
end
