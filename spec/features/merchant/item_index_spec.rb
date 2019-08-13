require "rails_helper"

RSpec.describe "Merchant Item Index Page", type: :feature do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @Kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")

    @bike = @meg.item.create!(name: "Bike", description: "It's a bike", price: 4000, image: "https://salsacycles.com/files/bikes/_small_image/2019_Marrakesh_Deore_Blue-uc-3.jpg", status: "active", inventory: 80)
    @rope = @brian.item.create!(name: "Rope", description: "It's some rope", price: 250, image: "https://www.rei.com/media/product/898355", status: "active", inventory: 50)
    @gummies = @kelly.item.create!(name: "Gummies", description: "It's a bag of gummies", price: 3, image: "https://sundayscaries.com/app/desktop/images/cbd-gummies-front.png", status: "active", inventory: 2000)
  end
  describe 'As a visitor' do
    it "When I visit '/merchants/:merchant_id/items', I see each Item that belongs
     to the Merchant with that merchant_id including the Item's attributes" do
      visit merchants_path

      click_link "Meg"
      expect(page).to have_link("Items")

      click_link "Items"
      expect(current_path).to eq(merchant_items_path)

      expect(page).to have_content(@bike.name)
      expect(page).to have_content(@bike.price)
      expect(page).to have_content(@bike.image)
      expect(page).to have_content(@bike.status)
      expect(page).to have_content(@bike.inventory)

      expect(page).to_not have_content(@rope.name)
      expect(page).to_not have_content(@gummies.name)
    end
  end
end
