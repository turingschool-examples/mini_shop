require 'rails_helper'

RSpec.describe "user sees all items" do
  describe "they visit /items" do
    it "displays all items" do
      merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
      merchant_2 = Merchant.create!(name: "Lord of the Rinse", address: "384 Spring Ave", city: "New York", state: "NY", zip: "11221" )
      merchant_3 = Merchant.create!(name: "Pita Pan", address: "930 Sunrise Blvd", city: "San Diego", state: "CA", zip: "92103" )

      # THAI TANIC
      item_1 = Item.create!(name: "Panang Curry", description: "Sweet and spicy Thai curry dish", price: 12.50, image_url: 'http://www.aspicyperspective.com/wp-content/uploads/2017/09/The-Best-Thai-Panang-Chicken-Curry-11.jpg', status: true, inventory: 12, merchant_id: merchant_1.id)
      item_2 = Item.create!(name: "Yam Talay", description: "Spicy Seafood Salad", price: 16.50, image_url: 'https://s3.amazonaws.com/finecooking.s3.tauntonclud.com/app/uploads/2017/04/18143140/fc87mc056-01-main.jpg', status: false, inventory: 8, merchant_id: merchant_1.id)

      # PITA PAN
      item_3 = Item.create!(name: "Stuffed Pita",description: "Veggies and hummus in pita", price: 12.50, image_url: 'https://www.landolakes.com/RecipeManagementSystem/media/Recipe-Media-Files/Recipes/Retail/DesktopImages/12565.jpg', status: false, inventory: 8, merchant_id: merchant_3.id)
      item_4 = Item.create!(name: "Pita Pizza", description: "Sauce and cheese in pita baked in oven", price: 10.50, image_url: 'https://purewows3.imgix.net/images/articles/2019_04/pita-pizzas-domestic-greek-recipe-921.jpg?auto=format,compress&cs=strip', status: true, inventory: 18, merchant_id: merchant_3.id)
      item_5 = Item.create!(name: "Pita Chips", description: "Baked and salted pita slices", price: 6.00, image_url: 'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/9c7590b4356c405ca11794c355ddac48/fb.jpg', status: true, inventory: 0, merchant_id: merchant_3.id)

      visit 'items/'

      expect(page).to have_link(item_1.name)
      expect(page).to have_link(item_2.name)
      expect(page).to have_link(item_3.name)
      expect(page).to have_link(item_4.name)
      expect(page).to have_link(item_5.name)
    end
  end
end
