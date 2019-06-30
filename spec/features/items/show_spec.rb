require 'rails_helper'

RSpec.describe "Items Show" do
  describe "As a visitor" do
    it "I see the item with that id and its info" do
      merchant_1 = Merchant.create(name: "What Ales You")
      item_1 = merchant_1.items.create(name: "Galaxy Hops", description: "Huge hop oil content with pungent citrus and passion fruit flavors.", price: 36.99, image: "https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/22454.png", active: true, inventory: 28)

      visit "/items/#{item_1.id}"

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.price)
      expect(page).to have_css("img[src*='#{item_1.image}']")
      expect(page).to have_content("In Stock")
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content(item_1.merchant.name)
    end

    it "I see a link to update a specific item and am taken to a form to update item info" do
      merchant = Merchant.create(name: "What Ales You")
      item = merchant.items.create(name: "Galaxy Hops", description: "Huge hop oil content with pungent citrus and passion fruit flavors.", price: 36.99, image: "https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/22454.png", active: true, inventory: 28)

      visit "/items/#{item.id}"
      click_on 'Update Item Info'

      expect(current_path).to eq("/items/#{item.id}/edit")

      fill_in 'Name', with: "Cashmere Hops"
      fill_in 'Price', with: "21.99"
      fill_in 'Description', with: "Hops that add an herbal, slightly spicy aroma with notes of lemon, lime, melon and stone fruit."
      fill_in 'Image', with: "https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/31983.png"
      fill_in 'Inventory', with: "38"

      click_on 'Update Item'

      expect(current_path).to eq("/items/#{item.id}")
      expect(page).to have_content("Cashmere Hops")
      expect(page).to have_content("21.99")
      expect(page).to have_content("Hops that add an herbal, slightly spicy aroma with notes of lemon, lime, melon and stone fruit.")
      expect(page).to have_css("img[src*='https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/31983.png']")
      expect(page).to have_content("38")
    end

    it "On an item page I see a link to the merchants page" do
      merchant = Merchant.create(name: "What Ales You")
      item = merchant.items.create(name: "Galaxy Hops", description: "Huge hop oil content with pungent citrus and passion fruit flavors.", price: 36.99, image: "https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/22454.png", active: true, inventory: 28)

      visit "/items/#{item.id}"

      click_on "What Ales You"

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end

  end
end
