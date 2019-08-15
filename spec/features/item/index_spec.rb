require "rails_helper"

RSpec.describe "Item Index Page", type: :feature do
  before :each do
    @meg = Merchant.create!(name: "Meg", address: "24 Bike Spoke Lane", city: "Denver", state: "CO", zip: "80237")
    @brian = Merchant.create!(name: "Brian", address: "549 Pike Peak Drive", city: "Greenville", state: "SC", zip: "23674")
    @kelly = Merchant.create!(name: "Kelly", address: "1 Lollipop Lane", city: "Candy Cane", state: "AZ", zip: "11265")

    @bike = @meg.items.create!(name: "Bike", description: "It's a bike", price: 4000, image: "https://salsacycles.com/files/bikes/_small_image/2019_Marrakesh_Deore_Blue-uc-3.jpg", status: "active", inventory: 80)
    @rope = @brian.items.create!(name: "Rope", description: "It's some rope", price: 250, image: "https://www.rei.com/media/product/898355", status: "active", inventory: 50)
    @gummies = @kelly.items.create!(name: "Gummies", description: "It's a bag of gummies", price: 3, image: "https://sundayscaries.com/app/desktop/images/cbd-gummies-front.png", status: "active", inventory: 2000)
  end
  describe 'As a visitor' do
    it "When I visit '/items', I see each item in the system, including the items attributes" do
      visit items_path
      
      expect(page).to have_content("Bike")
      expect(page).to have_content("Rope")
      expect(page).to have_content("Gummies")

      expect(page).to have_content(@bike.name)
      expect(page).to have_content(@bike.merchant.name)
      expect(page).to have_content(@bike.description)
      expect(page).to have_content(@bike.image)
      expect(page).to have_content(@bike.price)
      expect(page).to have_content(@bike.status)
      expect(page).to have_content(@bike.inventory)

      expect(page).to have_content(@rope.name)
      expect(page).to have_content(@rope.merchant.name)
      expect(page).to have_content(@rope.description)
      expect(page).to have_content(@rope.image)
      expect(page).to have_content(@rope.price)
      expect(page).to have_content(@rope.status)
      expect(page).to have_content(@rope.inventory)

      expect(page).to have_content(@gummies.name)
      expect(page).to have_content(@gummies.merchant.name)
      expect(page).to have_content(@gummies.description)
      expect(page).to have_content(@gummies.image)
      expect(page).to have_content(@gummies.price)
      expect(page).to have_content(@gummies.status)
      expect(page).to have_content(@gummies.inventory)
    end
  end
end
