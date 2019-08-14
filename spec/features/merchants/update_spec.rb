require 'rails_helper'

describe "As a visitor" do
  before :each do
  @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
  # @merchant_2 = Merchant.create(name: "merchant_2")
end

  describe "when I visit '/merchants/:id'" do
    it "Then I see the merchant with that id including" do
      visit "/merchants/#{@merchant_1.id}"
      expect(page).to have_link("Update")
      # binding.pry

      click_on("Update")
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/edit")

      fill_in :name, with: "Alec"
      fill_in :address, with: "835 Osceola"
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: "80204"
      click_on "Submit Update"

      expect(current_path).to eq("/merchants/#{@merchant_1.id}")
      expect(page).to have_content("Alec")
      expect(page).to have_content("80204")
    end
  end
end
