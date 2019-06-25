require 'rails_helper'

RSpec.describe 'merchants new entry', type: :feature do
  describe 'when a user visits the index page' do
    it 'user clicks to create a new merchant' do
      visit merchants_path
      click_link "Create a New Merchant"

      expect(current_path).to eq(new_merchant_path)

      fill_in "merchant[name]", with: "Jon"
      fill_in "merchant[address]", with: "200 E 10th"
      fill_in "merchant[city]", with: "Denver"
      fill_in "merchant[zip]", with: "80211"
      click_on "Create Merchant"

      expect(current_path).to eq(merchants_path)

      expect(page).to have_content("Jon")
    end
  end
end
