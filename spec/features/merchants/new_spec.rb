require 'rails_helper'

RSpec.describe "New Merchants" do
  describe "As a visitor" do
    it "I see a link to create a new merchant" do
      visit '/merchants'

      click_link 'New'

      expect(current_path).to eq("/merchants/new")

      fill_in "merchant[name]", with: "Knees Weak"
      fill_in "merchant[address]", with: "1 Oppurtunity Way"
      fill_in "merchant[city]", with: "Denver"
      fill_in "merchant[state]", with: "Colorado"
      fill_in "merchant[zip]", with: 80229
      click_on 'Create Merchant'

      expect(current_path).to eq("/merchants")
      expect(page).to have_content('Knees Weak')
    end
  end
end
