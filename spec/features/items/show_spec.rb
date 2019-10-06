require 'rails_helper'

RSpec.describe "From item show page", type: :feature do
  it "user can see info for an item" do
    valeo = Merchant.create(name: 'Valeo', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218)
    valeo_1 = valeo.items.create(name: 'Medicine Ball',
                                    description: 'This mb is awesome!',
                                    price: 45,
                                    image_url: 'https://i.imgur.com/pLRfskZ.jpg',
                                    active: true,
                                    inventory: 34)
    valeo_2 = valeo.items.create(name: 'Kettlebell',
                                    description: 'This valeo kb is the best!',
                                    price: 28,
                                    image_url: 'https://i.imgur.com/gP8UXpU.jpg',
                                    active: true,
                                    inventory: 60)

    visit "/items/#{valeo_1.id}"

    expect(page).to have_content("Medicine Ball")
    expect(page).to have_content("Active status: true")
    expect(page).to have_content("Price: $45")
    expect(page).to have_content("Description: This mb is awesome!")
    expect(page).to have_selector("img[src*='https://i.imgur.com/pLRfskZ.jpg']")
    expect(page).to have_content("Merchant: Valeo")
    expect(page).not_to have_content("Kettlebell")
  end
end
