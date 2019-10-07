require 'rails_helper'

RSpec.describe "merchant items index page" do
  describe "As a user" do
    it "I can see each Item that belongs to the Merchant with that merchant_id including each Items name, price, image, active status, and inventory" do
      book_shop = Merchant.create(name: "Flourish and Blotts", address: "123 Diagon Alley", city: "London", state: "UK", zip: 25126)

      book_1 = book_shop.items.create(name: "Advanced Potion-Making", description: "Bewitch the mind and ensare the senses.", price: 40, image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1510621089i/36591237._UY774_SS774_.jpg", inventory: 15)
      book_2 = book_shop.items.create(name: "Fantastic Beasts and Where to Find Them", description: "Billywigs, bowtruckles, and nifflers, oh my!", price: 35, image: "http://cdn.shopify.com/s/files/1/0064/5342/8271/products/HPFB1-fantastic-beasts-front-1200.jpg?v=1550953382", inventory: 20)

      visit "/merchants/#{book_shop.id}/items"

      expect(page).to have_content(book_1.name)
      expect(page).to have_content("Price: $#{book_1.price}")
      expect(page).to have_css("img[src*='#{book_1.image}']")
      expect(page).to have_content("Active")
      expect(page).to have_content("Inventory: #{book_1.inventory}")
      expect(page).to_not have_content(book_1.description)

      expect(page).to have_content(book_2.name)
      expect(page).to have_content("Price: $#{book_2.price}")
      expect(page).to have_css("img[src*='#{book_2.image}']")
      expect(page).to have_content("Active")
      expect(page).to have_content("Inventory: #{book_2.inventory}")
      expect(page).to_not have_content(book_2.description)
    end
  end
end
