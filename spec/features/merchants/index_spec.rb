require 'rails_helper'

RSpec.describe "Merchants Index" do
  describe "As a Visitor" do
    it "I see the name of each merchant in the system" do
      merchant_1 = Merchant.create(name: "She Sells Seashells")
      merchant_2 = Merchant.create(name: "Rubber Duckies")
      merchant_3 = Merchant.create(name: "Cheese and Wine")

      visit "/merchants"

      # save_and_open_page

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content(merchant_3.name)
    end
  end
end
