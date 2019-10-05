require 'rails_helper'

describe 'user can activate an item' do
  describe 'they link from item show page' do
    it 'toggles the status to inactive' do
      merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
      item_2 = Item.create!(name: "Yam Talay", description: "Spicy Seafood Salad", price: 16.50, image: 'https://s3.amazonaws.com/finecooking.s3.tauntonclud.com/app/uploads/2017/04/18143140/fc87mc056-01-main.jpg', status: "inactive", inventory: 8, merchant_id: merchant_1.id)

      visit "/items/#{item_2.id}"

      click_link "Activate"

      expect(page).to have_content("Status: inactive")

    end
  end
end
