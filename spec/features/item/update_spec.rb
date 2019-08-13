# the item's data is updated,
# and I am redirected to the Item Show page where I see the Item's updated information
require 'rails_helper'

RSpec.describe "Item Update" do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @Kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")

    @bike = @meg.item.create!(name: "Bike", description: "It's a bike", price: 4000, image: "https://salsacycles.com/files/bikes/_small_image/2019_Marrakesh_Deore_Blue-uc-3.jpg", status: "active", inventory: 80)
    @rope = @brian.item.create!(name: "Rope", description: "It's some rope", price: 250, image: "https://www.rei.com/media/product/898355", status: "active", inventory: 50)
    @gummies = @kelly.item.create!(name: "Gummies", description: "It's a bag of gummies", price: 3, image: "https://sundayscaries.com/app/desktop/images/cbd-gummies-front.png", status: "active", inventory: 2000)
  end
  describe "As a visitor, when I visit an Item Show page" do
    it "I see a link to update that Item" do
      visit items_path

      click_link "Bike"

      expect(page).to have_link("Update Item")
    end
    it "When I click the link, I am taken to '/items/:id/edit' where I see a form to edit the item's data" do
      visit items_path

      click_link "Bike"
      click_link "Update Item"
      expect(current_path).to eq(item_update_path)

      expect(page).to have_content("Update Item Information")

      expect(page).to have_content("Name")
      expect(page).to have_content("Price")
      expect(page).to have_content("Description")
      expect(page).to have_content("Image")
      expect(page).to have_content("Inventory")
    it "When I click the button to submit the form, the item's data is updated,
      and I am redirected to the Item Show page where I see the Item's updated information" do
      visit items_path
      click_link "Bike"
      click_link "Update Item"

      fill_in "Name", with: "Used Race Bike"
      fill_in "Price", with: 2000
      fill_in "Description", with: "It's a used bike"
      fill_in "Image", with: "https://marketplacer.imgix.net/SI/ccVn9r0-BkmqwwHNXACxjffWM.jpg?auto=format&fm=pjpg&fit=max&q=90&itemprop=image&alt=Buying%20a%20Cheap%20or%20Used%20Bike%3A%20What%20to%20Know&w=1600&h=1000&s=3aaf2e5959c62512c91d71de35e27078"
      fill_in "Inventory", with: 1

      click_on "Submit"
      expect(current_path).to eq(item_path)

      expect(page).to have_content("Used Race Bike")
      expect(page).to have_content("$2000")
      expect(page).to have_content("It's a used bike")
    end
    end
  end
end
