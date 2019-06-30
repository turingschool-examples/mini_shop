require 'rails_helper'

RSpec.describe "New Merchants" do
  describe "As a visitor" do
    it "I see a link to create a new merchant" do
      visit merchants_path

      click_link 'New'

      expect(current_path).to eq("/merchants/new")

      fill_in :name, with: "Knees Weak"
      fill_in :address, with: "1 Oppurtunity Way"
      fill_in :city, with: "Denver"
      fill_in :state, with: "Colorado"
      fill_in :zip, with: 80229
      click_on 'Create Merchant'

      expect(current_path).to eq("/merchants")
      expect(page).to have_content('Knees Weak')
    end
  end
end
