require 'rails_helper'

RSpec.describe "From items index page", type: :feature do
  it "user can see all items in the system" do
    merchants = Merchant.create([{ name: 'Valeo', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218 },
                                 { name: 'Spri', address: '346 Hope Ave', city: 'San Antonio', state: 'TX', zip: 78240 }])
    merchants.first.items.create(name: "Medicine Ball",
                         description: 'This mb is great!',
                         price: 45,
                         image_url: 'https://i.imgur.com/pLRfskZ.jpg',
                         active: true,
                         inventory: 23,
                      )

    merchants.last.items.create(name: 'Kettlebell',
                            description: 'This kb is awesome!',
                            price: 33,
                            image_url: 'https://i.imgur.com/BVEkfc7.jpg',
                            active: true,
                            inventory: 10
                          )

    visit "/items"

    expect(page).to have_content("Medicine Ball")
    expect(page).to have_content("Description: This mb is great!")
    expect(page).to have_content("Price: $45")
    expect(page).to have_selector("img[src*='https://i.imgur.com/pLRfskZ.jpg']")
    expect(page).to have_content("Active status: true")
    expect(page).to have_content("Inventory: 23")
    expect(page).to have_content("Merchant: Valeo")

    expect(page).to have_content("Kettlebell")
    expect(page).to have_content("Description: This kb is awesome!")
    expect(page).to have_content("Price: $33")
    expect(page).to have_selector("img[src*='https://i.imgur.com/BVEkfc7.jpg']")
    expect(page).to have_content("Active status: true")
    expect(page).to have_content("Inventory: 10")
    expect(page).to have_content("Merchant: Spri")
  end
end
