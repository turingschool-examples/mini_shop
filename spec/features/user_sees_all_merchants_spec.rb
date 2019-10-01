require 'rails_helper'

describe 'user sees all merchants' do
  describe 'they visit /merchants' do
    it 'displays all merchants' do
      merchant_1 = Merchant.create!(name: "Henry", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
      merchant_2 = Merchant.create!(name: "Olivia", address: "384 Spring Ave", city: "New York", state: "NY", zip: "11221" )
      merchant_3 = Merchant.create!(name: "Ava", address: "930 Sunrise Blvd", city: "San Diego", state: "CA", zip: "92103" )

      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content(merchant_3.name)
      expect(page).to have_content(merchant_1.zip)
      expect(page).to have_content(merchant_2.zip)
      expect(page).to have_content(merchant_3.zip)
    end
  end
end
