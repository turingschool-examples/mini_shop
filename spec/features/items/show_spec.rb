require "rails_helper"

RSpec.describe "Items index page", type: :feature do
  it "user can see all items" do


    merch_1 = Merchant.create(name: "Billy", address: "123 Ya moms house Circle", city: "Chicago",
      state: "Illinois", zip: 78047)

    item_1 = merch_1.items.create(name: "The Worlds Best Tooth Brush", description: "It's just a normal toothbrush.",
      price: 1.99, image_url: "first lengthy link", status: 0, inventory: 6)


    visit "/items/#{item_1.id}"


    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_1.image_url)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_1.merchant.name)

  end
end
