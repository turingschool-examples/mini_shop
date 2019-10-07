require 'rails_helper'

RSpec.describe 'From merchant items index page', type: :feature do
  it 'user can create a new item for that merchant' do
    merchant_1 = Merchant.create(name: 'Valeo', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80218)

    visit "/merchants/#{merchant_1.id}/items"

    click_link 'New Item'

    expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")

    fill_in "Name", with: "Dumbbells"
    fill_in "Price", with: 25
    fill_in "Description", with: "These dumbbells are great"
    page.attach_file("Image", Rails.root + 'app/assets/images/dumbbells.jpg')
    fill_in "Inventory", with: 80

    click_on 'Create Item'

    expect(current_path).to eq("/merchants/#{merchant_1.id}/items")
    expect(page).to have_content("Dumbbells")
    expect(page).to have_content("Price: $25")
    # expect(page).to have_content("Description: These dumbbells are great")
    expect(page).to has_css("img[src*= dumbbell.jpg]")
    expect(page).to have_content("Inventory: 80")
    expect(page).to have_content("Status: true")
  end
end
