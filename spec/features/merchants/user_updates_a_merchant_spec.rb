require "rails_helper"

RSpec.describe "user updates a merchant" do
  describe "they link from a show page" do
    describe "they fill in an edit form and submit" do
      it "displays the updated information on a show" do
        merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )

        visit "merchants/#{merchant_1.id}"
        click_link "Edit"


        fill_in "merchant[name]", with: "ThaiTanics"
        fill_in "merchant[address]", with: "410 Bleeker Ave"
        fill_in "merchant[city]", with: "Philadelphia"
        fill_in "merchant[state]", with: "PA"
        fill_in "merchant[zip]", with: "19107"
        click_on "Submit"
    
        expect(page).to have_content("ThaiTanics")
        expect(page).to have_content("410 Bleeker Ave")
        expect(page).to have_content("Philadelphia")
        expect(page).to have_content("PA")
        expect(page).to have_content("19107")
      end
    end
  end
end
