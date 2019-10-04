# require 'rails_helper'
#
# describe 'user sees only inactive items' do
#   describe 'they link from merchant items index' do
#     it 'displays only inactive items' do
#       merchant_3 = Merchant.create!(name: "Pita Pan", address: "930 Sunrise Blvd", city: "San Diego", state: "CA", zip: "92103" )
#       item_3 = Item.create!(name: "Stuffed Pita",description: "Veggies and hummus in pita", price: 12.50, image: 'https://www.landolakes.com/RecipeManagementSystem/media/Recipe-Media-Files/Recipes/Retail/DesktopImages/12565.jpg', status: "inactive", inventory: 8, merchant_id: merchant_3.id)
#       item_4 = Item.create!(name: "Pita Pizza", description: "Sauce and cheese in pita baked in oven", price: 10.50, image: 'https://purewows3.imgix.net/images/articles/2019_04/pita-pizzas-domestic-greek-recipe-921.jpg?auto=format,compress&cs=strip', status: "active", inventory: 18, merchant_id: merchant_3.id)
#       item_5 = Item.create!(name: "Pita Chips", description: "Baked and salted pita slices", price: 6.00, image: 'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/9c7590b4356c405ca11794c355ddac48/fb.jpg', status: "active", inventory: 0, merchant_id: merchant_3.id)
#
#       visit "/merchants/#{merchant_3.id}/items"
#       click_link "Active Items"
#
#       # expect(current_path).to eq("/merchants/#{merchant_3.id}/items?active=true")
#
#       expect(page).to_not have_content(item_3.name)
#       expect(page).to have_content(item_4.name)
#       expect(page).to have_content(item_5.name)
#
#     end
#   end
# end
