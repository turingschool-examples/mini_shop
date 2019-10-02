require 'rails_helper'

RSpec.describe "user sees one item" do
  describe "they visit /items/:id" do
    it "displays item information" do
      merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
      item_1 = Item.create!(name: "Panang Curry", description: "Sweet and spicy", price: 12.50, image: 'http://www.aspicyperspective.com/wp-content/uploads/2017/09/The-Best-Thai-Panang-Chicken-Curry-11.jpg', status: "active", inventory: 12, merchant_id: merchant_1.id)

      visit '/items'

      click_link item_1.name

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.price)
      expect(page.body).to include(item_1.image)
      expect(page).to have_content(item_1.status)
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content(merchant_1.name)

    end
  end
end
