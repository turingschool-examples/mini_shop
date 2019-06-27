require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit '/items'" do
    it "Then I see each Item in the system including the Item's: name, description, price, image, active/inactive status, inventory, the name of the merchant that sells the item" do
      m1 = Merchant.create!(name: 'bobs burgers', address: '123 burger lane', city: 'burger city', state: 'burgerana', zipcode: 12345)
      item_1 = m1.items.create(name: "burger", description: "juicy and delish", price: 5.00, image: "https://media.gettyimages.com/photos/burger-for-4th-of-july-picture-id683734168?s=2048x2048", active: true, inventory: 50, merchant_name: "bobs burgers")
      item_2 = m1.items.create(name: "fries", description: "crunchy and satisfying", price: 5.00, image: "https://static.olocdn.net/menu/applebees/d5d7db22de398d29f1d444cc550d8f58.jpg", active: true, inventory: 50, merchant_name: "bobs burgers")
      item_3 = m1.items.create(name: "hot fudge sundae", description: "mm mm good", price: 5.00, image: "https://static01.nyt.com/images/2017/06/12/dining/00Icecream11/00Icecream11-articleLarge.jpg", active: true, inventory: 50, merchant_name: "bobs burgers")
      item_4 = m1.items.create(name: "chx nuggets", description: "juicy and delish", price: 5.00, image: "https://media.gettyimages.com/photos/basket-of-chicken-nuggets-with-sweet-and-sour-sauce-picture-id618209540?s=612x612", active: true, inventory: 50, merchant_name: "bobs burgers")

      m2 = Merchant.create!(name: 'harrys hula hoops', address: '456 hoop street', city: 'hoop city', state: 'hoopland', zipcode: 67890)
      item_1 = m2.items.create(name: "polypro hula hoop", description: "round and hoopy", price: 20.00, image: "https://www.firegroovegear.com/image/cache/catalog/Products%20Clearance/C-Hoops-1inch-600x600.jpg", active: true, inventory: 50, merchant_name: "harrys hula hoops")
      item_2 = m2.items.create(name: "led hula hoop", description: "lights up!", price: 20.00, image: "https://images-na.ssl-images-amazon.com/images/I/61S0lNzzSpL._SX679_.jpg", active: true, inventory: 50, merchant_name: "harrys hula hoops")
      item_3 = m2.items.create(name: "gaffers tape", description: "decorate your own hoop with colored tape that provides a great grip!", price: 20.00, image: "https://cdn11.bigcommerce.com/s-f62ce/images/stencil/500x500/products/61/1270/510Wweb__04306.1537902536.jpg", active: true, inventory: 50, merchant_name: "harrys hula hoops")
      item_4 = m2.items.create(name: "pvc pipe", description: "make your own custom hoop out of pvc pipe!", price: 20.00, image: "https://images-na.ssl-images-amazon.com/images/I/318A0cHzMSL._SX342_.jpg", active: true, inventory: 50, merchant_name: "harrys hula hoops")

      visit '/items'

      expect(page).to have_content(item_1.name)
    end
  end
end
