require 'rails_helper'

RSpec.describe "Navigation" do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")

    @bike = @meg.items.create!(name: "Bike", description: "It's a bike", price: 4000, image: "https://salsacycles.com/files/bikes/_small_image/2019_Marrakesh_Deore_Blue-uc-3.jpg", status: "active", inventory: 80)
    @rope = @brian.items.create!(name: "Rope", description: "It's some rope", price: 250, image: "https://www.rei.com/media/product/898355", status: "active", inventory: 50)
    @gummies = @kelly.items.create!(name: "Gummies", description: "It's a bag of gummies", price: 3, image: "https://sundayscaries.com/app/desktop/images/cbd-gummies-front.png", status: "active", inventory: 2000)
  end
  describe "As a Visitor" do
    it "When I visit the welcome page I see the following links" do
      visit welcome_path

      expect(page).to have_link("Merchants")
      expect(page).to have_link("Items")
    end
    it "When I visit the Merchant Index Page, I see the following links" do
      visit merchants_path

      expect(page).to have_link("Items")
      expect(page).to have_link("Home")
    end
    it "When I visit the Item Index Page, I see the following links" do
      visit items_path

      expect(page).to have_link("Home")
      expect(page).to have_link("Merchants")
    end
    it "When I visit a Merchant Show Page, I see the following links" do
      visit merchants_path
      click_link "Meg"

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
    end
    it "When I visit an Item Show Page, I see the following links" do
      visit items_path
      click_link "Bike"

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
    end
    it "When I visit the Create Merchant Page, I see the following links" do
      visit new_merchant_path

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
    end
    it "When I visit the Create Item Page, I see the following links" do
      visit merchants_path
      click_link "Meg"
      click_link "Merchant Items"
      click_link "Add Item"

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
    end
    it "When I visit the Update Merchant Page, I see the following links" do
      visit merchants_path
      click_link "Meg"
      click_link "Update Merchant"

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
    end
    it "When I visit the Update Item Page, I see the following links" do
      visit merchants_path
      click_link "Meg"
      click_link "Merchant Items"
      click_link "Bike"
      click_link "Update Item"

      expect(page).to have_link("Home")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
    end
  end
end
