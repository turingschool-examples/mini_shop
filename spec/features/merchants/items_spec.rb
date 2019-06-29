require 'rails_helper'

RSpec.describe "Merchants Items" do
  describe "As a visitor" do
    it "When I visit a merchants page I see a list of their items including item info" do
      merchant = Merchant.create(name: "What Ales You")
      item = merchant.items.create(name: "Galaxy Hops", description: "Huge hop oil content with pungent citrus and passion fruit flavors.", price: 36.99, image: "https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/22454.png", active: true, inventory: 28)

      visit "/merchants/#{merchant.id}/items"

      expect(page).to have_content(item.name)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.active)
      expect(page).to have_content(item.inventory)
    end

    it "When I visit a merchants page I see a link to add a new item which takes me to a new item form" do
      merchant = Merchant.create(name: "What Ales You")

      visit "/merchants/#{merchant.id}/items"
      click_on 'New Item'

      expect(current_path).to eq("/merchants/#{merchant.id}/items/new")

      fill_in 'Name', with: "Cashmere Hops"
      fill_in 'Price', with: "21.99"
      fill_in 'Description', with: "Hops that add an herbal, slightly spicy aroma with notes of lemon, lime, melon and stone fruit."
      fill_in 'Image', with: "https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/31983.png"
      fill_in 'Inventory', with: "38"

      click_on 'Create Item'

      expect(current_path).to eq("/merchants/#{merchant.id}/items")
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.price)
      expect(page).to have_css("img[src*='#{item_1.image}']")
      expect(page).to have_content("In Stock")
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content(item_1.merchant.name)
    end

  end
end
