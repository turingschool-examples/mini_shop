require 'rails_helper'

describe 'user deletes an item' do
  describe 'user links from show page' do
    it 'displays all items without deleted item' do
      item_3 = Item.create!(name: "Stuffed Pita",description: "Veggies and hummus in pita", price: 12.50, image: 'https://www.landolakes.com/RecipeManagementSystem/media/Recipe-Media-Files/Recipes/Retail/DesktopImages/12565.jpg', status: "inactive", inventory: 8, merchant_id: merchant_3.id)
      item_4 = Item.create!(name: "Pita Pizza", description: "Sauce and cheese in pita baked in oven", price: 10.50, image: 'https://purewows3.imgix.net/images/articles/2019_04/pita-pizzas-domestic-greek-recipe-921.jpg?auto=format,compress&cs=strip', status: "active", inventory: 18, merchant_id: merchant_3.id)
      item_5 = Item.create!(name: "Pita Chips", description: "Baked and salted pita slices", price: 6.00, image: 'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/9c7590b4356c405ca11794c355ddac48/fb.jpg', status: "active", inventory: 0, merchant_id: merchant_3.id)

      visit "items/#{item_3.id}"
      click_link "Delete"

      expect(current_path).to eq('/items')

      expect(page).to_not have_content(item_3.name)
      expect(page).to have_content(item_4.name)
      expect(page).to have_content(item_5.name)

    end
  end
end
