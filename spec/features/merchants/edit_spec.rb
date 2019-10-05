require 'rails_helper'

RSpec.describe "merchant update page" do
  describe "as a user" do
    describe "when I visit the merchant show page and click on link to update merchant" do
      it "I can edit a merchant's information through an edit form" do
        wand_shop = Merchant.create(name: "Ollivanders", address: "125 Diagon Alley", city: "London", state: "UK", zip: 25126)

        visit "/merchants/#{wand_shop.id}"
        click_on "Update Merchant"

        fill_in :name, with: "Wandgardium Leviosa"
        fill_in :address, with: "126 Horizont Alley"
        fill_in :city, with: "Hogsmeade"
        fill_in :state, with: "AU"
        fill_in :zip, with: 25103

        click_button "Update Merchant"

        expect(current_path).to eq("/merchants/#{wand_shop.id}")
        expect(page).to have_content("Wandgardium Leviosa")
        expect(page).to have_content("126 Horizont Alley\nHogsmeade,AU,25103")
      end
    end
  end
end
