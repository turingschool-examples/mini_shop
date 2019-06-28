require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I link to '/merchants/:merchant_id/items/new'" do
    xit "I see a form to add a new item" do
      m1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)
      burger = m1.items.create!(name: "burger", description: "juicy and delish", price: 5.00, image: "https://media.gettyimages.com/photos/burger-for-4th-of-july-picture-id683734168?s=2048x2048", active: true, inventory: 50, merchant: "bobs burgers")

      visit "/merchants/#{m1.id}/items"
      click_link "Create a new item!"

      fill_in "Name", with: "burger"
      fill_in "Description", with: "juicy and delish"
      fill_in "Price", with: 5.00
      fill_in "Image", with: "https://media.gettyimages.com/photos/burger-for-4th-of-july-picture-id683734168?s=2048x2048"
      fill_in "Active", with: true
      fill_in "Inventory", with: 50
      fill_in "Merchant", with: "bobs burgers"
      click_on "Create Item"

      visit "/items"

      new_item = Item.last

      expect(current_path).to eq("/items/#{new_item.id}")
      expect(page).to have_content(name)
      expect(page).to have_content(description)
      expect(page).to have_content(price)
      expect(page).to have_content(image)
      expect(page).to have_content(active)
      expect(page).to have_content(inventory)
      expect(page).to have_content(m1.name)
    end
  end
end
