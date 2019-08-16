require "rails_helper"

RSpec.describe "items creation page", type: :feature do
  it "user can create item" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    merchant_2 = Merchant.create(name: "Cherry Corner", address: "456 Basket Cir", city: "Limon", state: "Colorado", zip: 80828)
    item_1 = merchant_1.items.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg", status: "active", inventory: 1)
    item_2 = merchant_1.items.create(name: "Dragon Fruit", description: "odd looking and very sweet", price: 1.91, image: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_800/https://www.vegaproduce.com/wp-content/uploads/2018/10/Dragon-Fruit-Golden-1.png", status: "active", inventory: 3)
    item_3 = merchant_2.items.create(name: "Kiwi", description: "juicy and fuzzy peel", price: 0.90, image: "https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317776/kiwi-fruit.jpg", status: "inactive", inventory: 0)

    visit "/merchants/#{merchant_1.id}/items"

    expect(page).to have_link("New Item")

    click_on "New Item"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")

    fill_in :name, with: "Strawberry"
    fill_in :description, with: "delectable and scrumptious"
    fill_in :price, with: 1.77
    fill_in :image, with: "https://images.pexels.com/photos/54624/strawberry-fruit-red-sweet-54624.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
    fill_in :inventory, with: 8

    click_on "Create Item"

    # new_merchant = Merchant.last
    expect(current_path).to eq("/merchants/#{merchant_1.id}/items")
    expect(page).to have_content("Strawberry")
    expect(page).to have_content("Price: $1.77")
    #expect(page).to have_css("https://images.pexels.com/photos/54624/strawberry-fruit-red-sweet-54624.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
    expect(page).to have_content("active")
    expect(page).to have_content("Inventory: 8")
  end
end
