require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit /merchants/:id" do
    it "Then I see the merchant with that id including the merchants: name, address, city, state, zip" do
      merchant_1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)
      merchant_2 = Merchant.create!(name: 'harrys hula hoops', address: '456 hoop street', city: 'hoop city', state: 'hoopland', zipcode: 67890)

      visit "/merchants/#{merchant_1.id}"

      # expect(current_path).to eq("/merchants/:id")
      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_1.address)
      expect(page).to have_content(merchant_1.city)
      expect(page).to have_content(merchant_1.state)
      expect(page).to have_content(merchant_1.zipcode)
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content(merchant_2.address)
      expect(page).to have_content(merchant_2.city)
      expect(page).to have_content(merchant_2.state)
      expect(page).to have_content(merchant_2.zipcode)
    end
  end
end
