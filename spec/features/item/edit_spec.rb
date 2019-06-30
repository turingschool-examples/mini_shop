require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I click a link to update an item' do
    it "I am taken to '/items/:id/edit' where I see a form to edit the item's data including: name, price, image, active/inactive status, inventory" do
      m1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)
      burger = m1.items.create(name: "burger", description: "juicy and delish", price: 5.00, image: "https://media.gettyimages.com/photos/burger-for-4th-of-july-picture-id683734168?s=2048x2048", active: true, inventory: 50)

      visit "/items/#{burger.id}"
      click_button 'Edit'

      fill_in "Name", with: "burger"
      fill_in "Description", with: "juicy and delish"
      fill_in "Price", with: 5.00
      fill_in "Image", with: burger.image
      fill_in "Inventory", with: 50
      fill_in "Active", with: true
      click_on "Submit"

      visit "/items/#{burger.id}"

      expect(current_path).to eq("/items/#{burger.id}")
      expect(page).to have_content(burger.name)
      expect(page).to have_content(burger.description)
      expect(page).to have_content(burger.price)
      expect(page).to have_css("img[src*='#{burger.image}']")
      expect(page).to have_content(burger.active)
      expect(page).to have_content(burger.inventory)
    end
  end
end
