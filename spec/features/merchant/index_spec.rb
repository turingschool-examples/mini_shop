require 'rails_helper'

RSpec.describe 'Merchant Index' do  
  describe "As a Visitor" do
    it "I see a list of all Merchants" do
      merchant_1 = Merchant.create(name: 'bobs burgers')
      merchant_2 = Merchant.create(name: 'harrys hula hoops')
      visit '/merchants'

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end
end
