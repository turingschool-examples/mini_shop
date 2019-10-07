require 'rails_helper'

describe 'user can deactivate an item' do
  describe 'they link from item show page' do
    it 'toggles the status to active' do
      merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
      item_1 = Item.create!(name: "Panang Curry", description: "Sweet and spicy Thai curry dish", price: 12.50, image_url: 'http://www.aspicyperspective.com/wp-content/uploads/2017/09/The-Best-Thai-Panang-Chicken-Curry-11.jpg', status: true, inventory: 12, merchant_id: merchant_1.id)

      visit "/items/#{item_1.id}"

      click_link "Deactivate"

      expect(page).to have_content("Status: inactive")

    end
  end
end
