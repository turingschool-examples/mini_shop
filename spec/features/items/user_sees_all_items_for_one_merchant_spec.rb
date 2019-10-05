require 'rails_helper'

describe "user sees all items for one merchant" do
  describe "they visit /merchant/:merchant_id/items" do
    it "displays all items for that merchant" do
      merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
      merchant_2 = Merchant.create!(name: "Lord of the Rinse", address: "384 Spring Ave", city: "New York", state: "NY", zip: "11221" )
      merchant_3 = Merchant.create!(name: "Pita Pan", address: "930 Sunrise Blvd", city: "San Diego", state: "CA", zip: "92103" )

      # THAI TANIC
      item_1 = merchant_1.items.create!(name: "Panang Curry", description: "Sweet and spicy", price: 12.50, image: 'http://www.aspicyperspective.com/wp-content/uploads/2017/09/The-Best-Thai-Panang-Chicken-Curry-11.jpg', status: "active", inventory: 12)
      item_2 = merchant_1.items.create!(name: "Yam Talay", description: "Spicy Seafood Salad", price: 16.50, image: 'https://s3.amazonaws.com/finecooking.s3.tauntonclud.com/app/uploads/2017/04/18143140/fc87mc056-01-main.jpg', status: "inactive", inventory: 8)

      # PITA PAN
      item_3 = merchant_3.items.create!(name: "Stuffed Pita",description: "Veggies and hummus", price: 12.50, image: 'https://www.landolakes.com/RecipeManagementSystem/media/Recipe-Media-Files/Recipes/Retail/DesktopImages/12565.jpg', status: "inactive", inventory: 8)
      item_4 = merchant_3.items.create!(name: "Pita Pizza", description: "Sauce and cheese", price: 10.50, image: 'https://purewows3.imgix.net/images/articles/2019_04/pita-pizzas-domestic-greek-recipe-921.jpg?auto=format,compress&cs=strip', status: "active", inventory: 18)
      item_5 = merchant_3.items.create!(name: "Pita Chips", description: "Baked and salted", price: 6.00, image: 'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/9c7590b4356c405ca11794c355ddac48/fb.jpg', status: "active", inventory: 0)

      visit "/merchants/#{merchant_3.id}/items"
      expect(page).to have_content(item_3.name)
      expect(page).to have_content(item_4.name)
      expect(page).to have_content(item_5.name)
      expect(page).to_not have_content(item_1.name)
      expect(page).to_not have_content(item_2.name)

     end
   end
 end
