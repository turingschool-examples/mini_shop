require "rails_helper"

RSpec.describe "item edit page", type: :feature do
  it "user can edit item" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    item_1 = merchant_1.items.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg", status: "active", inventory: 1)

    visit "/items/#{item_1.id}"

    expect(page).to have_link("Update Item")

    click_on "Update Item"

    expect(current_path).to eq("/items/#{item_1.id}/edit")

    expect(page).to have_link("Merchants")
    expect(page).to have_link("Items")

    fill_in :name, with: "A Pineapple"
    fill_in :description, with: "very large and not ripe at all"
    fill_in :price, with: 8.78
    fill_in :image, with: "https://search.chow.com/thumbnail/800/0/www.chowstatic.com/blog-media/2012/11/how-to-pick-a-ripe-pineapple-chowhound-670x446.jpg"
    fill_in :inventory, with: 22

    click_on "Update Item"

    # new_merchant = Merchant.last
    expect(current_path).to eq("/items/#{item_1.id}")
    expect(page).to have_content("A Pineapple")
    expect(page).to have_content("Price: $8.78")
    expect(page).to have_css("img[src*='https://search.chow.com/thumbnail/800/0/www.chowstatic.com/blog-media/2012/11/how-to-pick-a-ripe-pineapple-chowhound-670x446.jpg']")
    expect(page).to have_content("active")
    expect(page).to have_content("Inventory: 22")
    expect(page).to have_content("very large and not ripe at all")
  end
end
