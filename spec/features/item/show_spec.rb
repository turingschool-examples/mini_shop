require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit '/merchants/:merchant_id/items'" do
    it "Then I see each Item that belongs to the Merchant with that merchant_id including the Item's: name, price, image, active/inactive status, inventory" do
      m1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)
      item_1 = m1.items.create(name: "burger", description: "juicy and delish", price: 5.00, image: "https://media.gettyimages.com/photos/burger-for-4th-of-july-picture-id683734168?s=2048x2048", active: true, inventory: 50, merchant_name: "bobs burgers")

      visit "/items/#{item_1.id}"

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_1.image)
      expect(page).to have_content(item_1.active)
      expect(page).to have_content(item_1.inventory)
    end
  end
end
