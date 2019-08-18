require "rails_helper"

RSpec.describe "Item Update", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Megaman Vendor", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")
           @item_1 = Item.create!(name: "Item 1", description: "Description 1", price: 1.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/1/16207/1186400-oss.png", status: true, inventory: 5, merchant: @merchant_1)
           @item_2 = Item.create!(name: "Item 2", description: "Description 2", price: 2.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/8/87790/1806078-box_mmbn.png", status: true, inventory: 5, merchant: @merchant_1)
           @item_3 = Item.create!(name: "Item 3", description: "Description 3", price: 3.00, image: "https://images-na.ssl-images-amazon.com/images/I/616P8A8MYQL.jpg", status: true, inventory: 5, merchant: @merchant_2)

    it "When I visit an Item Show Page, I see a link to update that Item" do
      visit "/items/#{@item_1.id}"

      expect(page).to have_link("Update Item")

      click_link "Update Item"

      expect(current_path).to eq("/items/#{@item_1.id}/edit")

      new_name = "Updated Item"
      new_price = 10.00
      new_description = "Updated Description for Item 1"
      new_inventory = 18
      new_image = "https://giantbomb1.cbsistatic.com/uploads/scale_small/1/16207/1186400-oss.png"

      fill_in "Name", with: new_name
      fill_in "Price", with: new_price
      fill_in "Description", with: new_description
      fill_in "Inventory", with: new_inventory
      fill_in "Image", with: new_image

      click_button "Submit"

      expect(current_path).to eq("/items/#{@item_1.id}")

      # within "#item-id-#{@item_1.id}" do
        expect(page).to have_content(new_name)
        expect(page).to have_content(new_price)
        expect(page).to have_content(new_description)
        expect(page).to have_content(new_inventory)
        expect(page).to have_css("img[src*='#{new_image}']")
      end
    end
  end
end 
