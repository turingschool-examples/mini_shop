require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I visit the merchant index page" do
    it "I see all merchants" do
      merchant_1 = Merchant.create(name: "First Merch")
      merchant_2 = Merchant.create(name: "Second Merch")

      visit "/merchants"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end
end
