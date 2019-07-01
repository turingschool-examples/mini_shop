require 'rails_helper'

RSpec.describe 'Merchant Index' do
  describe "As a Visitor" do
    it "I see a list of all Merchants" do
      m1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)
      m2 = Merchant.create!(name: 'harrys hula hoops', address: '456 hoop street', city: 'hoop city', state: 'hoopland', zipcode: 67890)

      visit '/merchants'

      expect(current_path).to eq("/merchants")
      expect(page).to have_content(m1.name)
      expect(page).to have_content(m2.name)
    end
  end
end
