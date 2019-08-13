require 'rails_helper'

RSpec.describe "Merchant Item Creation" do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @Kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")

    @bike = @meg.item.create!(name: "Bike", description: "It's a bike", price: 4000, image: "https://salsacycles.com/files/bikes/_small_image/2019_Marrakesh_Deore_Blue-uc-3.jpg", status: "active", inventory: 80)
    @rope = @brian.item.create!(name: "Rope", description: "It's some rope", price: 250, image: "https://www.rei.com/media/product/898355", status: "active", inventory: 50)
    @gummies = @kelly.item.create!(name: "Gummies", description: "It's a bag of gummies", price: 3, image: "https://sundayscaries.com/app/desktop/images/cbd-gummies-front.png", status: "active", inventory: 2000)
  end
  describe "As a visitor, when I visit a Merchant Items Index page" do
    it "I see a link to add a new item for that merchant" do
      visit merchant_item_index_path

      expect(page).to have_link("Add Item")
    end
    it "When I click the link, I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item" do
      visit merchant_item_index_path

      click_link "Add Item"
      expect(current_path).to eq(new_item_path)

      expect(page).to have_content("New Item Form")
    end
    it "When I fill in the form with the item's attributes, and click submit,
     a new item is created for that merchant, that item has a status of 'active',
     and I am redirected to the Merchant Items Index page where I see the new item" do

      fill_in "Name", with: "Wheel"
      fill_in "Price", with: 60
      fill_in "Description", with: "It's a wheel"
      fill_in "Image", with: "https://cdn.shopify.com/s/files/1/0493/7269/products/JMO_1023_EDIT.jpg?v=1419279035"
      fill_in "Inventory", with: 30

      click_on "Submit"
      expect(current_path).to eq(merchant_item_index_path)

      expect(page).to have_content("Wheel")
      #within wheel expect(page).to have_content("active")
    end
  end
end
