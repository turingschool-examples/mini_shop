require "rails_helper"

RSpec.describe "items index page", type: :feature do
  it "user can see all items" do
    merchant_1 = Merchant.create(name: "Banana Bazaar", address: "123 Fruit Lane", city: "Niceville", state: "Florida", zip: 32578)
    item_1 = merchant_1.items.create(name: "Pineapple", description: "very large and very ripe", price: 3.23, image: "https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg", active_status: true, inventory: 1)

    visit "/items"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_css("img[src*='https://images-na.ssl-images-amazon.com/images/I/81qIPbnzqCL._SY679_.jpg']")
    expect(page).to have_content(item_1.active_status)
    expect(page).to have_content(item_1.inventory)
  end
end
