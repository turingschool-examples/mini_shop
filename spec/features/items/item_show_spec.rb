require 'rails_helper'

RSpec.describe "Item show page", type: :feature do
  it "can show all item attributes" do
    merchant_2 = Merchant.create(name: "Kitten Market",
                                 address: "818 Catastic Avenue",
                                 city: "Orlando",
                                 state: "FL",
                                 zip: 32810)

    item_1 = merchant_2.items.create(name: "Cat Carrier",
                           description: "Spacious carrier for your feline friend. It will feel like a hotel for your cat! Three zippable flaps.",
                           price: 27.42,
                           image: "https://i.imgur.com/1tX0wB0.jpg",
                           status: "active",
                           inventory: 3)

    visit "/items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='1tX0wB0']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(merchant_2.name)
  end
end
