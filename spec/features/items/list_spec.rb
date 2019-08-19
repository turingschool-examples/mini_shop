require "rails_helper"

RSpec.describe "merchants items page", type: :feature do
  it "user can see all items of merchants" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)
    item_1 = merchant_1.items.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg", status: "active", inventory: 1)
    item_2 = merchant_1.items.create(name: "Dragon Fruit", description: "odd looking and very sweet", price: 1.91, image: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_800/https://www.vegaproduce.com/wp-content/uploads/2018/10/Dragon-Fruit-Golden-1.png", status: "active", inventory: 3)

    visit "/merchants/#{merchant_1.id}/items"

    expect(page).to have_link("Merchants")
    expect(page).to have_link("Items")
    expect(page).to have_link(item_1.merchant.name)
    expect(page).to have_link(item_1.name)
    expect(page).to have_link(item_2.merchant.name)
    expect(page).to have_link(item_2.name)

    expect(page).to have_content(item_1.merchant.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_css("img[src*='https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_1.price)

    expect(page).to have_content(item_2.merchant.name)
    expect(page).to have_content(item_2.name)
    expect(page).to have_css("img[src*='https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_800/https://www.vegaproduce.com/wp-content/uploads/2018/10/Dragon-Fruit-Golden-1.png']")
    expect(page).to have_content(item_2.status)
    expect(page).to have_content(item_2.inventory)
    expect(page).to have_content(item_2.price)
  end
end
