require 'rails_helper'

describe "Item index page" do
  it "Can show all items and their attributes" do
    merchant_1 = Merchant.create(name: "Apple",
                              address: "123 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90001)
    item_1 = Item.create(name: "Pen",
                  description: "Ballpoint ink pen",
                        price: 5,
                        image: "https://www.newtimes.co.rw/sites/default/files/styles/mystyle/public/main/articles/2019/07/02/ballpoint-pen.jpg",
                       status: true,
                    inventory: 100,
                    merchant_id: merchant_1.id )
    item_2 = Item.create(name: "Watch",
                  description: "Mens wrist watch",
                        price: 110,
                        image: "https://i.imgur.com/owpKw1E.jpg",
                       status: false,
                    inventory: 50,
                    merchant_id: merchant_1.id )

    visit '/items'


    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='https://www.newtimes.co.rw/sites/default/files/styles/mystyle/public/main/articles/2019/07/02/ballpoint-pen.jpg']")
    expect(page).to have_content("Available")
    expect(page).to have_content(item_1.inventory)

    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img[src*='https://i.imgur.com/owpKw1E.jpg']")
    expect(page).to have_content("Unavailable")
    expect(page).to have_content(item_2.inventory)

  end
end
