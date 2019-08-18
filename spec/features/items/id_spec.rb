require "rails_helper"

RSpec.describe "merchants id page", type: :feature do
  it "user can see all merchants info" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)
    item_1 = merchant_1.items.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg", status: "active", inventory: 1)
    item_2 = merchant_1.items.create(name: "Dragon Fruit", description: "odd looking and very sweet", price: 1.91, image: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_800/https://www.vegaproduce.com/wp-content/uploads/2018/10/Dragon-Fruit-Golden-1.png", status: "active", inventory: 3)
    item_3 = merchant_2.items.create(name: "Kiwi", description: "juicy and fuzzy peel", price: 0.90, image: "https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317776/kiwi-fruit.jpg", status: "inactive", inventory: 0)

    visit "/items/#{item_1.id}"

    expect(page).to have_link("Merchants")
    expect(page).to have_link("Items")

    expect(page).to have_content(item_1.merchant.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_css("img[src*='https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_1.price)
  end

  it "user can delete item" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    item_1 = merchant_1.items.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg", status: "active", inventory: 1)

    visit "/items/#{item_1.id}"

    expect(page).to have_link("Delete Item")

    click_on "Delete Item"

    expect(current_path).to eq("/items")

    expect(page).not_to have_content(item_1.name)
    expect(page).not_to have_css("img[src*='https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg']")
    expect(page).not_to have_content(item_1.price)
  end
end
