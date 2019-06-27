require "rails_helper"

RSpec.describe "Merchant Show Page", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Merchant 1", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")
      @merchant_2 = Merchant.create!(name: "Merchant 2", address: "Address 2", city: "City 2", state: "State 2", zip: "Zip 2")
      @merchant_3 = Merchant.create!(name: "Merchant 3", address: "Address 3", city: "City 3", state: "State 3", zip: "Zip 3")
    end

    it "I see the merchant with that id including all the merchant's info" do
      visit "/merchants/#{@merchant_1.id}"

      within "#merchant-id-#{@merchant_1.id}" do
        expect(page).to have_content(@merchant_1.name)
        expect(page).to have_content(@merchant_1.address)
        expect(page).to have_content(@merchant_1.city)
        expect(page).to have_content(@merchant_1.state)
        expect(page).to have_content(@merchant_1.zip)
      end

      visit "/merchants/#{@merchant_2.id}"

      within "#merchant-id-#{@merchant_2.id}" do
        expect(page).to have_content(@merchant_2.name)
        expect(page).to have_content(@merchant_2.address)
        expect(page).to have_content(@merchant_2.city)
        expect(page).to have_content(@merchant_2.state)
        expect(page).to have_content(@merchant_2.zip)
      end

      visit "/merchants/#{@merchant_3.id}"

      within "#merchant-id-#{@merchant_3.id}" do
        expect(page).to have_content(@merchant_3.name)
        expect(page).to have_content(@merchant_3.address)
        expect(page).to have_content(@merchant_3.city)
        expect(page).to have_content(@merchant_3.state)
        expect(page).to have_content(@merchant_3.zip)
      end
    end

    it "I see a link to delete the merchant" do
      visit "/merchants/#{@merchant_2.id}"

      expect(page).to have_link("Delete")

      click_link "Delete"

      expect(current_path).to eq("/merchants")

      expect(page).to_not have_content(@merchant_2.name)
      expect(page).to_not have_content(@merchant_2.address)
      expect(page).to_not have_content(@merchant_2.city)
      expect(page).to_not have_content(@merchant_2.state)
      expect(page).to_not have_content(@merchant_2.zip)
    end
  end
end
