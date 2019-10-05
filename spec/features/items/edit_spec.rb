require 'rails_helper'

describe 'Item Update' do
  describe 'As a visitor' do
    it "I see a link to update an item when I go to the item show page" do
      merchant_1 = Merchant.create(
        name: "Hills Shop",
        address: "not cool place",
        city: "denver",
        state: "colorado",
        zip: "80210"
      )
      item_1 = merchant_1.items.create(
        name: "Fiddle Leaf", 
        price: 45, 
        description: "beautiful", 
        image: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg",
        status: "active",
        inventory: 23,
        merchant_name: merchant_1.name
      )
      visit "/items/#{item_1.id}"

      expect(page).to have_link("Edit Item")

      click_link "Edit Item"

      expect(current_path).to eq("/items/#{item_1.id}/edit")

      expect(page).to have_field("Name")
      expect(page).to have_field("Price")
      expect(page).to have_field("Description")
      expect(page).to have_field("Image")
      expect(page).to have_field("Inventory")

      fill_in "Name", with: "Super Fiddle Leaf"
      fill_in "Price", with: "120"
      fill_in "Description", with: "v v beautiful"
      fill_in "Image", with: "https://bloomscape.com/wp-content/uploads/2019/05/bloomscape_product-fiddle-leaf-fig-slate-2-e1558203121213-1500x1824.jpg"
      fill_in "Inventory", with: "34"

      click_button "Update Item"

      expect(current_path).to eq("/items/#{item_1.id}")
      expect(page).to have_content("Super Fiddle Leaf")
      expect(page).to have_content("120")
      expect(page).to have_content("v v beautiful")
      expect(page).to have_content("34")
    end
  end
end