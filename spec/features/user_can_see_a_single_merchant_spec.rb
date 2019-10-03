require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I visit a merchant show page" do
    it "I only see one merchant" do
      merchant_1 = Merchant.create(name: "First Merch")
      merchant_2 = Merchant.create(name: "Second Merch")

      visit "/merchants/#{merchant_1.id}"

      expect(page).to have_content(merchant_1.name)
      expect(page).to_not have_content(merchant_2.name)

      visit "/merchants/#{merchant_2.id}"

      expect(page).to have_content(merchant_2.name)
      expect(page).to_not have_content(merchant_1.name)
    end
  end
end
