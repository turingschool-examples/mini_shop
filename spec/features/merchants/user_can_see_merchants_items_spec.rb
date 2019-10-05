require 'rails_helper'

describe "When at merchants/:merchant_id/items" do
  it "Displays all items sold by that merchant" do

    merchant_1 = Merchant.create(name: "Apple",
                              address: "123 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90001)
    merchant_2 = Merchant.create(name: "Google",
                              address: "456 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90002)
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
    item_3 = Item.create(name: "Dress Shoes",
                  description: "Mens dress shoes",
                        price: 85,
                        image: "https://i.imgur.com/vNI9ncq.jpg",
                       status: true,
                    inventory: 75,
                    merchant_id: merchant_2.id )


    visit "/merchants/#{item_1.merchant_id}/items"
    save_and_open_page

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='https://www.newtimes.co.rw/sites/default/files/styles/mystyle/public/main/articles/2019/07/02/ballpoint-pen.jpg']")
    expect(page).to have_content("Available")
    expect(page).to have_content(item_1.inventory)

    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img[src*='https://i.imgur.com/owpKw1E.jpg']")
    expect(page).to have_content("Unavailable")
    expect(page).to have_content(item_2.inventory)

    expect(page).to_not have_content(merchant_2.name)
    expect(page).to_not have_content(item_3.name)
    expect(page).to_not have_content(item_3.price)
    expect(page).to_not have_css("img[src*='https://i.imgur.com/vNI9ncq.jpg']")
    expect(page).to_not have_content(item_3.inventory)
    expect(page).to_not have_content(item_1.description)
    expect(page).to_not have_content(item_2.description)


  end
end
