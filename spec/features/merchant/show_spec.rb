require "rails_helper"

RSpec.describe "Merchant Show Page", type: :feature do
  describe 'As a visitor' do
    before :each do
      @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    end
    it "When I visit '/merchants/:id', I see the merchant with that id including the merchant's attributes" do
      visit merchant_path

      expect(page).to have_content("Meg")
      expect(page).to have_content("24 Bike Spoke Lane")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("80237")
    end
  end
end
