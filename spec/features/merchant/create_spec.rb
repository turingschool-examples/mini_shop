require "rails_helper"

RSpec.describe "Merchant Index Page", type: :feature do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @Kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")
  end
  describe 'As a visitor' do
    it "When I visit '/merchants', I see a link to create a new merchant" do
      visit merchants_path
      expect(page).to have_link("Create Merchant")
    end

    it "When I click this link, I am taken to '/merchants/new' where I  see a form for a new merchant" do
      visit merchants_path
      click_link "Create Merchant"
      expect(current_path).to eq(new_merchant_path)
      expect(page).to have_content("New Merchant Form")
    end

    it "When I fill out the form with a new merchant's attributes, and click the
        button to submit the form, a new merchant is created and I am redirected
        to the Merchant Index page where I see the new Merchant listed" do

      name = "Nicholas"
      address = "123 EBITDA Drive"
      city = "Danvers"
      state = "FL"
      zip = 12345

      fill_in "Name", with: name
      fill_in "Address", with: address
      fill_in "City", with: city
      fill_in "State", with: state
      fill_in "Zip", with: zip

      click_on "Submit"
      expect(current_path).to eq(merchants_path)
      expect(page).to have_content("Nicholas")
    end
  end
end
