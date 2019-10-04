require 'rails_helper'

RSpec.describe "item index page", type: :feature do
  it "can list all items" do
    merchant_1 = Merchant.create(name: "Puppers R Us",
                                 address: "425 Dog Day Street",
                                 city: "Denver",
                                 state: "CO",
                                 zip: 80210)

    merchant_2 = Merchant.create(name: "Kitten Market",
                                 address: "818 Catastic Avenue",
                                 city: "Orlando",
                                 state: "FL",
                                 zip: 32810)

    merchant_3 = Merchant.create(name: "Owl City",
                                 address: "739 Hoot Boulevard",
                                 city: "New Orleans",
                                 state: "LA",
                                 zip: 70010)

    item_1 = merchant_1.items.create(name: "Dog Bed",
                                     description: "Luxury memory foam dog bed for your pupper (dog not included!)",
                                     price: 80,
                                     image: "/app/assets/images/dog_bed.jpg",
                                     status: "active",
                                     inventory: 7)

    item_2 = merchant_2.items.create(name: "Cat Carrier",
                                     description: "Spacious carrier for your feline friend. It will feel like a hotel for your cat! Three zippable flaps.",
                                     price: 27.42,
                                     image: "/app/assets/images/cat_carrier.jpg",
                                     status: "active",
                                     inventory: 3)
                                     
    item_3 = merchant_3.items.create(name: "Leather Falconry Gloves",
                                     description: "Pristine leather falconry gloves, one size fits all. Superior quality and build. Lifetime warranty.",
                                     price: 149.99,
                                     image: "/app/assets/images/falconry_gloves.jpg",
                                     status: "active",
                                     inventory: 2)

    visit '/items'

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='dog_bed']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(merchant_1.name)

    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img[src*='cat_carrier']")
    expect(page).to have_content(item_2.status)
    expect(page).to have_content(item_2.inventory)
    expect(page).to have_content(merchant_2.name)

    expect(page).to have_content(item_3.name)
    expect(page).to have_content(item_3.description)
    expect(page).to have_content(item_3.price)
    expect(page).to have_css("img[src*='falconry_gloves']")
    expect(page).to have_content(item_3.status)
    expect(page).to have_content(item_3.inventory)
    expect(page).to have_content(merchant_3.name)
  end
end
