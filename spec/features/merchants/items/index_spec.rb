require 'rails_helper'

RSpec.describe 'From merchant item index page', type: :feature do
  it 'user can see all items that belong to a merchant' do
    merchant_1 = Merchant.create(name: 'Valeo', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218)
    merchant_2 = Merchant.create(name: 'Spri', address: '346 Hope Ave', city: 'San Antonio', state: 'TX', zip: 78240)
    item_1 = merchant_1.items.create(name: 'Medicine Ball',
                                    description: 'This mb is awesome!',
                                    price: 45,
                                    image_url: 'https://i.imgur.com/pLRfskZ.jpg',
                                    inventory: 34)
    item_2 = merchant_1.items.create(name: 'Kettlebell',
                                    description: 'This valeo kb is the best!',
                                    price: 28,
                                    image_url: 'https://i.imgur.com/gP8UXpU.jpg',
                                    inventory: 60)
    item_3 = merchant_2.items.create(name: 'Purple Kettlebell',
                                    description: 'This kb is awesome!',
                                    price: 33.40,
                                    image_url: 'https://i.imgur.com/BVEkfc7.jpg',
                                    inventory: 10)

    visit "/merchants/#{merchant_1.id}/items"

    expect(page).to have_content("Medicine Ball")
    expect(page).to_not have_content("Description: This mb is awesome!")
    expect(page).to have_content("Price: $45")
    expect(page).to have_selector("img[src*='https://i.imgur.com/pLRfskZ.jpg']")
    expect(page).to have_content("Status: true")
    expect(page).to have_content("Inventory: 34")

    expect(page).to have_content("Kettlebell")
    expect(page).to_not have_content("This valeo kb is the best!")
    expect(page).to have_content("Price: $28")
    expect(page).to have_selector("img[src*='https://i.imgur.com/gP8UXpU.jpg']")
    expect(page).to have_content("Status: true")
    expect(page).to have_content("Inventory: 60")

    expect(page).to_not have_content("Purple Kettlebell")
    expect(page).to_not have_content("This kb is awesome!")
    expect(page).to_not have_content("Price: $33")
    expect(page).to_not have_selector("img[src*='https://i.imgur.com/BVEkfc7.jpg']")
    expect(page).to_not have_content("Inventory: 10")
  end
end
