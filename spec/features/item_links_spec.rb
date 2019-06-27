
require "rails_helper"

  RSpec.describe "click name of Merchant and be sent to it's show", type: :feature do

    it "Merchants Index" do

      merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
        state: "Illinois", zip: 78047)
      merch_2 = Merchant.create(name: "Mr. Guy", address: "1 big ole' Drive", city: "Honolulu",
        state: "Hawaii", zip: 11111)
      merch_3 = Merchant.create(name: "Penny Pinchin' Paul", address: "345 10th St", city: "Denver",
        state: "Colorado", zip: 80204)
      merch_4 = Merchant.create(name: "Money Mike", address: "$$ Money Drive", city: "Cashville",
        state: "New York", zip: 90876)

        item_1 = merch_1.items.create(name: "The Worlds Best Tooth Brush", description: "It's just a normal toothbrush.",
          price: 1.99, image_url: "first lengthy link", status: 0, inventory: 6)
        item_2 = merch_2.items.create(name: "The worlds worst ear Brush", description: "A brush for your ear made of gold.",
          price: 199.99, image_url: "second lengthy link", status: 1, inventory: 1)
        item_3 = merch_3.items.create(name: "A real fake mustache!", description: "An actual fake mustache.",
          price: 0.99 ,  image_url: "third lengthy link", status: 0, inventory: 689)
        item_4 = merch_4.items.create(name: "Air holding Box", description: "Our lightest box yet.",
          price: 3.99, image_url: "fourth lengthy link", status: 0, inventory: 0)
        item_5 = merch_1.items.create(name: "Sunglass is", description: "You can't see at night.",
          price: 14.99, image_url: "last lengthy link", status: 0, inventory: 5)

        visit "/items"


        click_link "The Worlds Best Tooth Brush"

        expect(current_path).to eq("/items/#{item_1.id}")

    end

  end
