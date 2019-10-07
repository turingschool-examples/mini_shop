require 'rails_helper'

RSpec.describe "item show page" do
  describe "as a user" do
    describe "when I visit an item's show page" do
      it "I see the item with that id and its name, status, price, description, image, inventory, and seller" do
        book_shop = Merchant.create(name: "Flourish and Blotts", address: "123 Diagon Alley", city: "London", state: "UK", zip: 25126)
        book_1 = book_shop.items.create(name: "Advanced Potion-Making", description: "Bewitch the mind and ensare the senses.", price: 40, image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1510621089i/36591237._UY774_SS774_.jpg", inventory: 15)

        visit "/items/#{book_1.id}"

        expect(page).to have_content(book_1.name)
        expect(page).to have_content("Active")
        expect(page).to have_content("Price: $#{book_1.price}")
        expect(page).to have_content(book_1.description)
        expect(page).to have_css("img[src*='#{book_1.image}']")
        expect(page).to have_content("Inventory: #{book_1.inventory}")
        expect(page).to have_content("Seller: #{book_shop.name}")
      end
    end
  end
end
