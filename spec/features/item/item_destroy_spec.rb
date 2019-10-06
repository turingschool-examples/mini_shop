require 'rails_helper'

describe "Item Deletion" do
  it "Can delete and Item" do
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
    click_button 'Delete'
    expect(current_path).to eq("/items")
    expect(page).to_not have_content("Goldfish")
  end
end
