require 'rails_helper'

describe 'Item Show Page' do
  it 'can show all item info' do
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
      image: '/app/assets/images/test.PNG',
      inventory: '730',
    )
    visit "/items/#{item_1.id}"
    expect(page).to have_content('Goldfish')
    expect(page).to have_content('Description: 24 count of snack goldfish packs')
    expect(page).to have_content('Price: $10.99')
    expect(page).to have_content('Status: Active')
    expect(page).to have_content('Stock: 730')
    expect(page).to have_content('Seller: Costco')
  end
end
