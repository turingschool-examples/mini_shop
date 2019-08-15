require "rails_helper"

RSpec.describe "Merchant Delete", type: :feature do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")
  end
  describe "As a visitor, when I visit a merchant show page" do
    it "I see a link to delete the merchant" do
      visit merchant_path(@meg)

      expect(page).to have_link("Delete Merchant")
    end
    it "When I click the link, the merchant is deleted, and I am redirected to the merchant index page where I no longer see this merchant" do
      visit merchant_path(@meg)

      click_link "Delete Merchant"
      expect(current_path).to eq(merchants_path)

      expect(page).to_not have_content("Meg")
      expect(page).to have_content("Brian")
      expect(page).to have_content("Kelly")
    end
  end
end
