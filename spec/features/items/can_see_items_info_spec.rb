require 'rails_helper'

describe "When visiting /items/:id" do
  it "Shows that items attributes" do

    merchant_1 = Merchant.create(name: "Apple",
                              address: "123 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90001)

    item_1 = Item.create(name: "Watch",
                  description: "Mens wrist watch",
                        price: 110,
                        image: "https://i.imgur.com/owpKw1E.jpg",
                       status: false,
                    inventory: 50,
                    merchant_id: merchant_1.id )

   visit "items/#{item_1.id}"

   expect(page).to have_content(merchant_1.name)
   expect(page).to have_content(item_1.name)
   expect(page).to have_content(item_1.description)
   expect(page).to have_content(item_1.price)
   expect(page).to have_css("img[src*='https://i.imgur.com/owpKw1E.jpg']")
   expect(page).to have_content("Unavailable")
   expect(page).to have_content(item_1.inventory)

  end
end
