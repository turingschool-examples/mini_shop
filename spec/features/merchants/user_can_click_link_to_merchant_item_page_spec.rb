# As a visitor
# When I visit a merchant show page ('/merchants/:id')
# Then I see a link to take me to that merchant's items page ('/merchants/:id/items')

require 'rails_helper'


RSpec.describe "As a visitor" do
  describe "When I visit a merchant show page" do
    it "has a link that takes me to that merchant's items page" do
      merchant_1 = Merchant.create(
        name: "REI",
        address: "1234 Smith Street",
        city: "Boulder",
        state: "Colorado",
        zip: "80303"
      )
      item_1 = Item.create(
        name: "Beanie",
        description: "It's a hat",
        price: 50,
        image: 'https://images.app.goo.gl/iDdDGM1vEZpUBY4M6',
        active: true,
        inventory: 50,
        merchant_id: merchant_1.id
      )

      visit "/merchants/#{merchant_1.id}"
      click_on 'View Items'
      expect(current_path).to eq("/merchants/#{merchant_1.id}/items")

    end
  end
end
