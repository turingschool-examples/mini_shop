require 'rails_helper'

describe 'Item Delete' do
  describe 'As a visitor' do
    describe 'When I visit an item show page' do
      it 'I see a link to delete the item' do
        merchant_1 = Merchant.create(
          name: "Hills Shop",
          address: "not cool place",
          city: "denver",
          state: "colorado",
          zip: "80210"
        )
        item_1 = merchant_1.items.create(
          name: "Pine Tree", 
          price: 15, 
          description: "ugly", 
          image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
          status: "active",
          inventory: 23,
          merchant_name: merchant_1.name
        )

        visit "/items/#{item_1.id}"

        expect(page).to have_button("Delete")

        click_button "Delete"

        expect(current_path).to eq('/items')
        expect(page).to_not have_content(item_1.name)
        expect(page).to_not have_content(item_1.price)
        expect(page).to_not have_content(item_1.description)
      end
    end
  end
end