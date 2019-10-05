require 'rails_helper'

RSpec.describe "Merchant item index page", type: :feature do
  it "can show all items for specific merchant" do
    merchant_1 = Merchant.create(name: "Puppers R Us",
                                 address: "425 Dog Day Street",
                                 city: "Denver",
                                 state: "CO",
                                 zip: 80210)

    item_1 = merchant_1.items.create(name: "Dog Bowl",
                           description: "5\" stainless steel dog bowl",
                           price: 35.99,
                           image: "https://i.imgur.com/3H1e3k7.jpg",
                           status: "active",
                           inventory: 5)

    item_2 = merchant_1.items.create(name: "Dog Bed",
                           description: "Luxury memory foam dog bed for your pupper (dog not included!)",
                           price: 80,
                           image: "https://i.imgur.com/D8a4HLN.jpg",
                           status: "active",
                           inventory: 7)

    merchant_2 = Merchant.create(name: "Kitten Market",
                                address: "818 Catastic Avenue",
                                city: "Orlando",
                                state: "FL",
                                zip: 32810)

    item_3 = merchant_2.items.create(name: "Cat Carrier",
                            description: "Spacious carrier for your feline friend. It will feel like a hotel for your cat! Three zippable flaps.",
                            price: 27.42,
                            image: "https://i.imgur.com/1tX0wB0.jpg",
                            status: "active",
                            inventory: 3)

    item_4 = merchant_2.items.create(name: "Cat Post",
                            description: "Scratching and resting post combo, two for one! 27\" tall.",
                            price: 25,
                            image: "https://i.imgur.com/vim9kYM.jpg",
                            status: "active",
                            inventory: 9)

    visit "/merchants/#{merchant_1.id}/items"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.inventory)

    expect(page).not_to have_content(item_3.name)
    expect(page).not_to have_content(item_4.name)
  end
end
