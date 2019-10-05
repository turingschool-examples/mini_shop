require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit /items' do
    it 'I can see all items' do
      merchant_1 = Merchant.create(
        name: "Hills Shop",
        address: "not cool place",
        city: "denver",
        state: "colorado",
        zip: "80210"
      )
      merchant_2 = Merchant.create(
        name: "Pauls Shop",
        address: "cool place",
        city: "denver",
        state: "colorado",
        zip: "80210"
      )
      item_1 = merchant_1.items.create(
        name: "Fiddle Leaf", 
        description: "beautiful", 
        price: 45, 
        image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
        status: "active",
        inventory: 23,
        merchant_name: merchant_1.name
      )
      item_2 = merchant_2.items.create(
        name: "Snake Plant", 
        description: "v v beautiful", 
        price: 35, 
        image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
        status: "active",
        inventory: 3,
        merchant_name: merchant_2.name
      )

      visit "/items"

      expect(page).to have_content('Fiddle Leaf')
      expect(page).to have_content('Snake Plant')
     end
  end
end