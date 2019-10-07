require 'rails_helper'

describe "As a Visitor" do
  describe "You can get rid of a merchant" do
    it "Can click delete and remove the merchant" do
      merchant_1 = Merchant.create(
        name: 'Costco',
        address: '123 Main st',
        city: 'Lakewood',
        state: 'CO',
        zip: '80127'
      )
      visit "/merchants/#{merchant_1.id}"
      expect(page).to have_button('Delete')
      click_on('Delete')
      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content('Costco')
    end
  end
end
