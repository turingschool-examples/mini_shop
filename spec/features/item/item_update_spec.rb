require 'rails_helper'

describe "Item Update Page" do
  it "can fill a form and show updated item" do
    merchant_1 = Merchant.create(
      name: 'Costco',
      address: '123 Main st',
      city: 'Lakewood',
      state: 'CO',
      zip: '80127'
    )
    item_1 = merchant_1.items.create(
      name: 'Goldfish',
      description: '24 count of snack goldfish packs',
      price: '10.99',
      image: 'https://images-na.ssl-images-amazon.com/images/I/51g4wmu9MEL.jpg',
      inventory: '730',
    )
    visit "/items/#{item_1.id}"
    click_link 'Edit'
    expect(current_path).to eq("/items/#{item_1.id}/edit")
    fill_in 'name', with: 'Cheez-Its'
    fill_in 'description', with: '45 count of snack cheez-it packs'
    fill_in 'price', with: '14.99'
    fill_in 'image', with: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8-8XA-5ay0GQ2Z0QzLFhpIZsWg49ZBA26sjOHaVw4qr_qoowJ'
    fill_in 'inventory', with: '500'
    click_button 'Update'
    expect(current_path).to eq("/items/#{item_1.id}")
    expect(page).to have_content('Cheez-Its')
    expect(page).to have_content('45 count of snack cheez-it packs')
    expect(page).to have_content('14.99')
    expect(page).to have_content('500')
    expect(page).to have_content('Active')
    expect(page).to have_link('Costco')
  end
end
