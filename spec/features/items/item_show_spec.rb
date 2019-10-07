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

  it "can edit item attributes" do
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

    click_link 'Edit'

    expect(current_path).to eq("/items/#{item_1.id}/edit")

    fill_in 'Name', with: 'Dog Brush'
    fill_in 'Description', with: 'Premium dog brush to keep your pupper clean and well-groomed. Made with exotic horse hair bristles and rich mahogany.'
    fill_in 'image_url', with: 'https://i.imgur.com/ZISd7fm.jpg'
    fill_in 'Price', with: 24.99
    fill_in 'Inventory', with: 22

    click_button 'Submit'

    expect(current_path).to eq("/items/#{item_1.id}")

    expect(page).to have_content('Dog Brush')
    expect(page).to have_content('Premium dog brush to keep your pupper clean and well-groomed. Made with exotic horse hair bristles and rich mahogany.')
    expect(page).to have_css("img[src*='ZISd7fm']")
    expect(page).to have_content(24.99)
    expect(page).to have_content(22)
  end

  it "can delete an item" do
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

    item_2 = merchant_2.items.create(name: "Cat Post",
                           description: "Scratching and resting post combo, two for one! 27\" tall.",
                           price: 25,
                           image: "https://i.imgur.com/vim9kYM.jpg",
                           status: "active",
                           inventory: 9)

    visit "/items/#{item_1.id}"

    click_button 'Delete'

    expect(current_path).to eq('/items')

    expect(page).to_not have_content(item_1.name)
    expect(page).to_not have_content(item_1.description)
    expect(page).to_not have_content(item_1.price)
    expect(page).to_not have_content(item_1.inventory)
  end
end
