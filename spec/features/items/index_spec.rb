require 'rails_helper'

RSpec.describe "item index page" do
  describe "As a user" do
    it "I can see all items in the system including their attributes" do
      book_shop = Merchant.create(name: "Flourish and Blotts", address: "123 Diagon Alley", city: "London", state: "UK", zip: 25126)
      wand_shop = Merchant.create(name: "Ollivanders", address: "125 Diagon Alley", city: "London", state: "UK", zip: 25126)

      book_1 = book_shop.items.create(name: "Advanced Potion-Making", description: "Bewitch the mind and ensare the senses.", price: 40, image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1510621089i/36591237._UY774_SS774_.jpg", inventory: 15)
      book_2 = book_shop.items.create(name: "Fantastic Beasts and Where to Find Them", description: "Billywigs, bowtruckles, and nifflers, oh my!", price: 35, image: "http://cdn.shopify.com/s/files/1/0064/5342/8271/products/HPFB1-fantastic-beasts-front-1200.jpg?v=1550953382", inventory: 20)
      wand = wand_shop.items.create(name: "Vine Wood Wand", description: "Vine wood with a dragon heartstring core.", price: 100, image: "https://images-na.ssl-images-amazon.com/images/I/816nAgnLhXL._AC_SL1500_.jpg", active?:false, inventory: 2)

      visit '/items'

      expect(page).to have_content(book_1.name)
      expect(page).to have_content(book_1.description)
      expect(page).to have_content("Price: $#{book_1.price}")
      expect(page).to have_content("Inventory: #{book_1.inventory}")
      expect(page).to have_content(book_2.name)
      expect(page).to have_content(book_2.description)
      expect(page).to have_content("Price: $#{book_2.price}")
      expect(page).to have_content("Inventory: #{book_2.inventory}")
    end
  end
end
