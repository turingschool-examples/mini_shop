require "rails_helper"

RSpec.describe "Merchant Index Page", type: :feature do
  describe 'As a visitor' do
    before :each do
      @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
      @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
      @Kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")
    end
    it "When I visit '/merchants', I see the name of each merchant in the system" do
      visit merchants_path
      expect(page).to have_content("Meg")
      expect(page).to have_content("Brian")
      expect(page).to have_content("Kelly")
    end
  end
end
