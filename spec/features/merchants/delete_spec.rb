require 'rails_helper'

describe 'As a visitor' do
  describe 'I visit a merchant show page' do
    it 'I click delete to remove the merchant' do
      hills_shop = Merchant.create(name: "Hills Shop",
                                  address: "not cool place",
                                  city: "denver",
                                  state: "colorado",
                                  zip: "80210")

      pauls_shop = Merchant.create(name: "Pauls Shop",
      address: "very cool place",
      city: "denver",
      state: "colorado",
      zip: "80210")

      visit "/merchants/#{hills_shop.id}"

      click_button "Delete"

      expect(current_path).to eq('/merchants')
      expect(page).to have_content("Pauls Shop")
      expect(page).to_not have_content("hills_shop.name")
    end
  end
end