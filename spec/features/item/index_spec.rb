require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit '/items'" do
    it "Then I see each Item in the system including the Item's: name, description, price, image, active/inactive status, inventory, the name of the merchant that sells the item" do
      m1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)
      item_1 = m1.items.create(name: "burgers", description: "juicy and delish", price: 5.00, image: "https://media.gettyimages.com/photos/burger-for-4th-of-july-picture-id683734168?s=2048x2048", active: true, inventory: 50, merchant_name: "bobs burgers")

      merchant_2 = Merchant.create(name: 'harrys hula hoops')

      visit '/items'

      expect(page).to have_content(item_1.name)
    end
  end
end
