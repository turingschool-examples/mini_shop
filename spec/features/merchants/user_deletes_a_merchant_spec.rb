require 'rails_helper'

RSpec.describe "user deletes a merchant" do
  describe "they link from a show page" do
    it "displays all merchants without the deleted merchant" do
      merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
      merchant_2 = Merchant.create!(name: "Lord of the Rinse", address: "384 Spring Ave", city: "New York", state: "NY", zip: "11221" )
      merchant_3 = Merchant.create!(name: "Pita Pan", address: "930 Sunrise Blvd", city: "San Diego", state: "CA", zip: "92103" )

      visit "/merchants/#{merchant_2.id}"
      click_link "Delete"

      expect(current_path).to eq('/merchants')
      expect(page).to have_link(merchant_1.name)
      expect(page).to_not have_link(merchant_2.name)
      expect(page).to have_link(merchant_3.name)

    end
  end
end
