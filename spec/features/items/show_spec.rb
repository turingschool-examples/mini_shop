require 'rails_helper'

RSpec.describe "Items Show" do
  describe "As a Visitor" do
    describe "When I "
    it "I see the name of each merchant in the system" do
      merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

      visit "/merchants/#{merchant_1.id}"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_1.address)
      expect(page).to have_content(merchant_1.city)
      expect(page).to have_content(merchant_1.state)
      expect(page).to have_content(merchant_1.zipcode)
    end
  end
end
