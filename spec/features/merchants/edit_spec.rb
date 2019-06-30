require 'rails_helper'

RSpec.describe "Update Merchants" do
  describe "As a visitor" do
    describe "When I visit the merchant show page" do
      it "I can update a Merchant" do

        merchant_1 = Merchant.create(
          name: "Knees Weak",
          address: "1 Oppurtunity Way",
          city: "Denver",
          state: "Colorado",
          zip: 80229
        )

        visit "/merchants/#{merchant_1.id}"

        click_link 'Edit'

        expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

        fill_in :name, with: "Mom's Spaghetti"
        fill_in :address, with: "1 Moment Way"
        fill_in :city, with: "Las Vegas"
        fill_in :state, with: "Nevada"
        fill_in :zip, with: 80003
        click_on 'Update Merchant'

        expect(current_path).to eq("/merchants/#{merchant_1.id}")
        within("#merchant-#{merchant_1.id}") do
          expect(page).to have_content("Mom's Spaghetti")
          expect(page).to have_content("1 Moment Way")
          expect(page).to have_content("Las Vegas")
          expect(page).to have_content("Nevada")
          expect(page).to have_content(80003)
        end
      end
    end
  end
end
