require 'rails_helper'

RSpec.describe "Merchants Show" do
  describe "As a visitor" do
    it "I see the merchant with that ID and their info" do
      merchant = Merchant.create(name: "Carl's Cyclery", address: "123 Puma Drive", city: "Denver", state: "CO", zip: "80210"),

      visit "/merchants/#{merchant.id}"

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(merchant.address)
      expect(page).to have_content(merchant.city)
      expect(page).to have_content(merchant.state)
      expect(page).to have_content(merchant.zip)
    end
  end
end
