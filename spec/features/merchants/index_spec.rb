require 'rails_helper'

RSpec.describe "Merchants Index" do
  describe "As a Visitor" do
    it "I see the name of each merchant in the system" do
      merchant_1 = Merchant.create!(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

      visit "/merchants"

      # save_and_open_page

      expect(page).to have_content(merchant_1.name)
    end
  end
end
